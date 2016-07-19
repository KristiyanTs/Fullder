# frozen_string_literal: true
class AddProductSizeToOrderItem < ActiveRecord::Migration
  def change
    add_reference :order_items, :product_size, index: true, foreign_key: true
  end
end
