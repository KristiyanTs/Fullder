# frozen_string_literal: true
# == Schema Information
#
# Table name: restaurants
#
#  id                             :integer          not null, primary key
#  name                           :string
#  address                        :string
#  description                    :text
#  phone_number                   :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  restaurant_avatar_file_name    :string
#  restaurant_avatar_content_type :string
#  restaurant_avatar_file_size    :integer
#  restaurant_avatar_updated_at   :datetime
#  latitude                       :float
#  longitude                      :float
#

class Restaurant < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :permission_roles, dependent: :destroy
  has_many :orders
  has_many :tables

  has_attached_file :restaurant_avatar, styles: { large: '300x300' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :restaurant_avatar, content_type: /\Aimage\/.*\Z/

  ransacker :search_name, formatter: proc { |v| v.mb_chars.downcase.to_s } do |parent|
    Arel::Nodes::NamedFunction.new('LOWER',
                                   [Arel::Nodes::NamedFunction.new('concat_ws',
                                                                   [Arel::Nodes.build_quoted(' '), parent.table[:name], parent.table[:address], parent.table[:id]])])
  end

  geocoded_by :address # can also be an IP address
  after_validation :geocode, if: :address_changed? # auto-fetch coordinates

  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lng
end
