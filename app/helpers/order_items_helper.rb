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

  def option_names(item)
    names = []
    item.options.each do |opt|
      names << opt.name
    end
    names
  end
end
