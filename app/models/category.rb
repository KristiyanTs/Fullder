# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id                  :integer          not null, primary key
#  restaurant_id       :integer
#  supercategory_id    :integer
#  name                :string
#  age_restriction     :boolean
#  available_all_day   :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_categories_on_restaurant_id     (restaurant_id)
#  index_categories_on_supercategory_id  (supercategory_id)
#
# Foreign Keys
#
#  fk_rails_ec0260600b  (restaurant_id => restaurants.id)
#

class Category < ApplicationRecord
  belongs_to :restaurant
  belongs_to :supercategory, class_name: "Category"

  has_many :products
  has_many :subcategories, class_name: "Category", foreign_key: "supercategory_id", dependent: :destroy

  has_attached_file :avatar, styles: { small: '80x80#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  translates :name

  scope :search, -> (keyword) do
    keyword = "%#{keyword}%"
    with_translations.where('categories.name ilike ?', keyword)
  end
end
