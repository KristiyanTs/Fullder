class Dashboard::OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_order_item, only: [:update, :show]

  def index
    @orders = @restaurant.order_items.where(payed: true)

    if params[:order_status] == 'unready'
      @orders = @orders.where(ready: false).page(params[:page])

    elsif params[:order_status] == 'ready'
      @orders = @orders.where('ready=? AND delivered=?', true, false).page(params[:page])

    elsif params[:order_status] == 'delivered'
      @orders = @orders.where('ready=? AND delivered=?', true, true).page(params[:page])

    else
      @orders = @orders.page(params[:page])
    end
  end

  def show

  end

  def update
    if !@order_item.ready
      @order_item.update(ready: true)
    elsif @order_item.ready && !@order_item.delivered
      @order_item.update(delivered: true)
    else
      notice[:error] = "No such action."
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
