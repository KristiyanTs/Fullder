# frozen_string_literal: true
module OrdersHelper
  def order_restaurant
    current_order.order_items.first.product.restaurant
  end
end
