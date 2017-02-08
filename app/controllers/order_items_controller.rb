# frozen_string_literal: true
class OrderItemsController < ApplicationController
  include OrderItemsHelper
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(session[:restaurant_id])
    @order_item = OrderItem.new(order_item_params)
    @order_item.restaurant_id = @restaurant.id
    respond_to do |format|
      if order_exists?
        add_item
        format.js
      else
        session[:order_item] = @order_item
        redirect_to new_order_path and return
      end
    end
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)

    respond_to do |format|
      if @order_item.update(order_item_params)
        @order_items = current_order.order_items.order('created_at DESC')
        format.html { redirect_to cart_path }
        format.json { render json: current_order.subtotal }
        format.js   
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item = current_order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items.order('updated_at DESC')
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :size_id, :demands, :restaurant_id,
                                       option_ids: [])
  end
end
