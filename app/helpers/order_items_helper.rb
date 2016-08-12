# frozen_string_literal: true
module OrderItemsHelper
  def table_in_this_restaurant?
    current_order.restaurant_id == @order_item.product.restaurant_id && !current_order.table_id.nil?
  end

  def clear_order
    current_order.restaurant_id = @order_item.product.restaurant_id
    current_order.order_items.destroy_all
    current_order.save
  end

  def add_item
    current_order.order_items << @order_item
    current_order.save
  end

  def item_exists?
    current_order.order_items.each do |item|
      if @order_item.product_id == item.product_id &&
         @order_item.size_id == item.size_id &&
         @order_item.demands == item.demands
        item.quantity += @order_item.quantity
        item.save
        return true
       end
    end
    false
  end
end
