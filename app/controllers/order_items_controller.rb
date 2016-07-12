class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_order

  def create
    @order_item = OrderItem.new(order_item_params)
    
    if @order.restaurant_id == @order_item.product.restaurant_id and !@order.table_id.nil?
      @order.order_items << @order_item
      @order.save
    else
      @order.order_items.destroy_all
      @order.order_items << @order_item
      @order.restaurant_id = @order_item.product.restaurant_id
      @order.save
      
      session[:order_id] = @order.id
      session[:product_id] = @order_item.product.id

      respond_to do |format|
        format.html { redirect_to edit_order_path(current_order)}
        format.js   { render js: "window.location = #{edit_order_path(current_order).to_json}"}     
      end
    end
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :product_size_id)
  end

  def set_order
    @order = current_order
  end
end




