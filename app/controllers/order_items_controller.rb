# frozen_string_literal: true
class OrderItemsController < ApplicationController
  include OrderItemsHelper
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @order_item = OrderItem.new(order_item_params)
    respond_to do |format|
      if @order_item.valid?
        if table_in_this_restaurant?
          add_item

          format.html
          format.js
        else
          clear_order
          add_item

          session[:order_id] = current_order.id
          session[:product_id] = @order_item.product.id

          format.html { redirect_to edit_order_path(current_order) }
          format.js do
            render js: "window.location = #{edit_order_path(current_order).to_json}",
                   flash: { notice: 'Order was added to your cart.' }
          end
        end
      else
        flash[:error] = @order_item.errors.full_messages.to_sentence
        format.js { render 'layouts/flash_messages' }
      end
    end
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)

    respond_to do |format|
      if @order_item.update(order_item_params)
        @order_items = current_order.order_items
        format.html { redirect_to cart_path }
        format.json { render json: current_order.subtotal }
        format.js   { flash[:notice] = 'Your order was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item = current_order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :size_id, :demands,
                                       option_ids: [])
  end
end
