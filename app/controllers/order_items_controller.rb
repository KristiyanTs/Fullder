class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_order
    @order_item = OrderItem.new(order_item_params)

    if @order.restaurant_id != @order_item.product.restaurant_id
      @order.order_items.destroy_all
      @order.order_items << @order_item
      @order.restaurant_id = @order_item.product.restaurant_id
    else
      @order.order_items << @order_item
    end
    
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :product_size_id)
  end
end
