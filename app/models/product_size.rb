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

class ProductSize < ActiveRecord::Base
  belongs_to :product
  
  has_many :order_items
end
