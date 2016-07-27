# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_status_id :integer
#  restaurant_id   :integer
#  user_id         :integer
#  subtotal        :decimal(, )
#  tax             :decimal(, )
#  shipping        :decimal(, )
#  tip             :decimal(, )
#  total           :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  table_id        :integer
#  table_number    :integer
#
# Indexes
#
#  index_orders_on_order_status_id  (order_status_id)
#  index_orders_on_restaurant_id    (restaurant_id)
#  index_orders_on_table_id         (table_id)
#  index_orders_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_7a22cf8b0e  (order_status_id => order_statuses.id)
#  fk_rails_9af093cac8  (restaurant_id => restaurants.id)
#  fk_rails_aaccb1d5d0  (table_id => tables.id)
#  fk_rails_f868b47f6a  (user_id => users.id)
#

class Order < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  belongs_to :order_status
  belongs_to :table

  has_many :order_items, dependent: :destroy

  validate :table_exists?
  before_create :set_order_status
  before_save :update_subtotal
  before_save :set_table

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def table_exists?
    if !Restaurant.find(self.restaurant_id).tables.exists?(number: self[:table_number])
      errors.add(:table_number, "Table with this number does not exist")
    end
  end

  def set_table
    self[:table_id] = Restaurant.find(self[:restaurant_id]).tables.find_by(number: self[:table_number]).id
  end
end
