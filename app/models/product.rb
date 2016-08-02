# frozen_string_literal: true
# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  restaurant_id        :integer
#  category_id          :integer
#  name                 :string
#  short_description    :string
#  description          :text
#  price                :decimal(, )
#  active               :boolean
#  average_prepare_time :integer
#  ready                :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  avatar_file_name     :string
#  avatar_content_type  :string
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#
# Indexes
#
#  index_products_on_category_id    (category_id)
#  index_products_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_009fa2d872  (restaurant_id => restaurants.id)
#  fk_rails_fb915499a4  (category_id => categories.id)
#

class Product < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :category

  has_many :product_sizes, dependent: :destroy
  has_many :order_items

  accepts_nested_attributes_for :product_sizes

  default_scope { where(active: true) }

  has_attached_file :avatar, styles: { small: '80x80#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  acts_as_taggable
  acts_as_taggable_on :allergens

end
