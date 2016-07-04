# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  restaurant_id       :integer
#  category_id         :integer
#  name                :string
#  short_description   :string
#  description         :text
#  price               :decimal(, )
#  active              :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Product < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :category

  has_many :product_sizes
  has_many :order_items

  accepts_nested_attributes_for :product_sizes

  default_scope { where(active: true) }

  has_attached_file :avatar, styles: { small: '80x80#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
