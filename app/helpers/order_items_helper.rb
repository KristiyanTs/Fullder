module OrderItemsHelper

  def has_table_in_this_restaurant?
    @order.restaurant_id == @order_item.product.restaurant_id && !@order.table_id.nil?
  end

  def clear_and_add_new_item_to_order
    @order.restaurant_id = @order_item.product.restaurant_id
    @order.order_items.destroy_all
    @order.order_items << @order_item
    @order.save
  end
end
