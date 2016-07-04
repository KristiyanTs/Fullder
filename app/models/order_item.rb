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
      product_size_id.nil? ? product.price : product.price + product.product_sizes.find(product_size_id).price # TODO: check if there is such a size
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
