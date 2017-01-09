# frozen_string_literal: true
# == Schema Information
#
# Table name: order_items
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  product_id    :integer
#  order_id      :integer
#  size_id       :integer
#  unit_price    :decimal(, )
#  quantity      :integer
#  total_price   :decimal(, )
#  demands       :string
#  status        :string
#  received_at   :datetime
#  ready_at      :datetime
#  delivered_at  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_order_items_on_order_id       (order_id)
#  index_order_items_on_product_id     (product_id)
#  index_order_items_on_restaurant_id  (restaurant_id)
#  index_order_items_on_size_id        (size_id)
#
# Foreign Keys
#
#  fk_rails_28971b9eb6  (size_id => sizes.id)
#  fk_rails_627d4b6e9b  (restaurant_id => restaurants.id)
#  fk_rails_e3cb28f071  (order_id => orders.id)
#  fk_rails_f1a29ddd47  (product_id => products.id)
#

class OrderItem < ApplicationRecord
  ORDER_STATUSES = %w(unpaid unready ready delivered).freeze
  belongs_to :order
  belongs_to :product
  belongs_to :size
  belongs_to :restaurant

  has_many :options_order_items, dependent: :destroy
  has_many :options, through: :options_order_items
  accepts_nested_attributes_for :options

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :size_selected
  validate :options_allowed?
  validate :allowed_status?

  before_save :finalize
  before_save :check_status

  def unit_price
    if persisted?
      self[:unit_price]
    else
      size_id.nil? ? product.price : product.price + product.sizes.find(size_id).price
    end
  end

  def total_price
    unit_price * quantity
  end

  def next_status
    self.received_at = Time.current if self.status == 'unpaid'
    self.ready_at = Time.current if self.status == 'unready'
    self.delivered_at = Time.current if self.status == 'ready'

    return false if ORDER_STATUSES.index(self.status) == ORDER_STATUSES.length-1
    next_index = ORDER_STATUSES.index(self.status) + 1
    self.update(status: ORDER_STATUSES[next_index])  
    status  
  end
  
  def product_present
    errors.add(:product, 'is not valid or is not active.') if product.nil?
  end

  def size_selected
    self[:size_id] = product.sizes.first.id if product.sizes.any? && size_id.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

  def options_allowed?
    options.each do |option|
      if options.where(group_id: option.group.id).count > option.group.maximum
        errors.add(:product_id, message: 'Do not exceed the maximum for options!')
      end
    end
  end

  def allowed_status?
    ORDER_STATUSES.include?(status)
  end

  def check_status
    status = 'ready' if status == 'unready' && product.ready
  end
end
