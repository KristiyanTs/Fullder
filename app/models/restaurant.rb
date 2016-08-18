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
#  country                        :string           default("en-GB")
#  latitude                       :float
#  longitude                      :float
#  sells_online                   :boolean
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  restaurant_avatar_file_name    :string
#  restaurant_avatar_content_type :string
#  restaurant_avatar_file_size    :integer
#  restaurant_avatar_updated_at   :datetime
#

class Restaurant < ApplicationRecord
  acts_as_taggable

  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :permission_roles, dependent: :destroy
  has_many :orders
  has_many :order_items, through: :orders
  has_many :tables, dependent: :destroy
  has_many :working_times, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  accepts_nested_attributes_for :working_times, allow_destroy: true
  accepts_nested_attributes_for :images, reject_if: :all_blank,
                                         allow_destroy: true

  has_attached_file :restaurant_avatar, styles: { large: '1500x1500' },
                                        default_url: '/images/:style/missing.png'
  validates_attachment_content_type :restaurant_avatar,
                                    content_type: /\Aimage\/.*\Z/

  geocoded_by :address # can also be an IP address

  after_validation :geocode, if: :address_changed? # auto-fetch coordinates

  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lng

  scope :search_word, -> (keyword) do
    keywords = keyword.split(/\W+/)
    if keywords.size <= 1
      word = "%#{keyword}%"
      from_columns = where('restaurants.name ilike ? or restaurants.address ilike ?', word, word)
      from_tags = tagged_with(keywords)
      return (from_tags.or(from_columns))
    else
      result = Restaurant.all
      keywords.each do |word|
        word = "%#{word}%"
        result = result.merge(where('restaurants.name ilike ? or restaurants.address ilike ?', word, word))
      end
      return (result.or(tagged_with(keywords)))
    end
  end

  def working?
    working_times.any?(&:active_now?)
  end

  translates :description
end
