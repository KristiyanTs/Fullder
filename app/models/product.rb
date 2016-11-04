# frozen_string_literal: true
# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  restaurant_id        :integer
#  category_id          :integer
#  price                :decimal(, )
#  active               :boolean
#  average_prepare_time :integer
#  ready                :boolean
#  created_at           :datetime
#  updated_at           :datetime
#  avatar_file_name     :string
#  avatar_content_type  :string
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#  weight               :string
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

class Product < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :sizes, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :options, through: :groups
  has_many :order_items

  accepts_nested_attributes_for :sizes, allow_destroy: true
  accepts_nested_attributes_for :groups, allow_destroy: true

  default_scope { where(active: true) }

  has_attached_file :avatar, styles: { small: '140x140#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, length: { maximum: 24 }
  validates :category_id, presence: true
  validates :short_description, presence: true, length: { maximum: 130 }
  validates :price, presence: true

  acts_as_taggable
  acts_as_taggable_on :allergens

  translates :name, :short_description, :description

  scope :search, -> (keyword) do
    unless keyword.blank?
      keyword = "%#{keyword}%"
      where('products.name ilike ?',
            keyword)
    end
  end

  def self.import!(restaurant_id, file_name)
    ProductImporter.import!(restaurant_id, file_name)
  end
end
