class Dashboard::OrderItemsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_order_item, only: [:update, :show]

  def index
    session[:order_status] = params[:order_status] || session[:order_status]
    @items = @restaurant.order_items.where(status: session[:order_status]).page(params[:page]).per(15)
    respond_to do |format|
      format.html {}
      format.js {
        @partial_name = "element_row_#{session[:order_status]}"
      }
    end
  end

  def show

  end

  def update
    if params[:order_action] == "reported"
      @order_item.order.user.reset_rating
    else
      @order_item.next_status
    end
    
    @order_item.order.user.add_rating if @order_item.status == "delivered"
    @items = @restaurant.order_items.where(status: session[:order_status]).page(params[:page])

    respond_to do |format|
      format.js
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_order_item
    @order_item = @restaurant.order_items.find(params[:id])
  end
end
