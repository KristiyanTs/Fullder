class OrderItemsController < ApplicationController
  include OrderItemsHelper

  before_action :authenticate_user!

  def create
    @order_item = OrderItem.new(order_item_params)
    
    if table_in_this_restaurant?
      unless item_exists?
        current_order.order_items << @order_item
        current_order.save
      end
    else
      clear_order
      add_item

      session[:order_id] = current_order.id
      session[:product_id] = @order_item.product.id

      respond_to do |format|
        format.html { redirect_to edit_order_path(current_order) }
        format.js   { render js: "window.location = #{edit_order_path(current_order).to_json}" }
      end
    end
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
  end

  def destroy
    @order_item = current_order.order_items.find(params[:id])
    @order_item.destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :product_size_id, :demands)
  end
end
