# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  table_id      :integer
#  subtotal      :decimal(, )
#  tax           :decimal(, )
#  shipping      :decimal(, )
#  tip           :decimal(, )
#  total         :decimal(, )
#  table_number  :integer
#  address       :string
#  payed         :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_orders_on_restaurant_id  (restaurant_id)
#  index_orders_on_table_id       (table_id)
#  index_orders_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_9af093cac8  (restaurant_id => restaurants.id)
#  fk_rails_aaccb1d5d0  (table_id => tables.id)
#  fk_rails_f868b47f6a  (user_id => users.id)
#

class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  belongs_to :table

  has_many :order_items, dependent: :destroy

  before_save :update_subtotal
  before_save :set_table
  after_validation :set_total
  validate :table_exists?

  def subtotal
    order_items.collect { |oi| oi.valid? ? oi.total_price : 0 }.sum
  end

  def ready?
    order_items.all? {|oi| oi.ready_at != nil}
  end

  def fulfils_requirements?
    return false if address && restaurant.min_delivery_price && subtotal < restaurant.min_delivery_price
    return true
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def table_exists?
    if self[:table_number] && !Restaurant.find(restaurant_id).tables.exists?(number: self[:table_number])
      errors.add(:table_number, 'Table with this number does not exist')
    end
  end

  def set_table
    if table_number
      self[:table_id] = Restaurant.find(restaurant_id).tables.find_by(number: table_number).id
    end
  end

  def set_total
    total = subtotal + (address ? restaurant.delivery_cost : 0)
  end
end
