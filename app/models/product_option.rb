# == Schema Information
#
# Table name: product_options
#
#  id         :integer          not null, primary key
#  name       :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_options_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_1843d87019  (product_id => products.id)
#

class ProductOption < ApplicationRecord
  belongs_to :product

  has_many :order_options
  has_many :order_items, through: :order_options

  translates :name
end
