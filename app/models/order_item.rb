# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  order_id        :integer
#  unit_price      :decimal(, )
#  quantity        :integer
#  total_price     :decimal(, )
#  choices         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_size_id :integer
#
# Indexes
#
#  index_order_items_on_order_id         (order_id)
#  index_order_items_on_product_id       (product_id)
#  index_order_items_on_product_size_id  (product_size_id)
#
# Foreign Keys
#
#  fk_rails_d2069138be  (product_size_id => product_sizes.id)
#  fk_rails_e3cb28f071  (order_id => orders.id)
#  fk_rails_f1a29ddd47  (product_id => products.id)
#

class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_size
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product_size_id.nil? ? product.price : product.price + product.product_sizes.find(product_size_id).price
    end
  end

  def total_price
    unit_price * quantity
  end
  
  private

  def product_present
    errors.add(:product, 'is not valid or is not active.') if product.nil?
  end

  def order_present
    errors.add(:order, 'is not a valid order.') if order.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
