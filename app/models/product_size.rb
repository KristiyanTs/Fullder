# == Schema Information
#
# Table name: product_sizes
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  name              :string
#  price             :decimal(, )
#  short_description :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_product_sizes_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_f477a9dc4a  (product_id => products.id)
#

class ProductSize < ActiveRecord::Base
  belongs_to :product

  has_many :order_items
end
