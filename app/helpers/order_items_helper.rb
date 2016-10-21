module OrderItemsHelper

  def order_exists?
    current_order.restaurant_id == @restaurant.id
  end

  # Verifies that the order is valid
  def current_order_valid?
    current_order.table_id || current_order.address
  end

  # Adds the order item to the current_order
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

  def delivery_destination(item)
    if item.order.table_number
      (t 'order.table') + " " + item.order.table_number.to_s 
    else
      (t 'order.delivery') + " " + item.order.address
    end
  end 
end
