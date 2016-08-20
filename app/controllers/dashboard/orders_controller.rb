# frozen_string_literal: true
class Dashboard::OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  before_action :set_restaurant

  def index
    @ready_items = @restaurant.orders.where(order_status_id: '3').collect(&:order_items).where(ready: true)
    @ready_items = OrderItem.where(id: @ready_items.map(&:ids)).page(params[:page]).decorate

    @awaiting_items = @restaurant.orders.where(order_status_id: '3').collect(&:order_items).where(ready: false)
    @awaiting_items = OrderItem.where(id: @awaiting_items.map(&:ids)).page(params[:page]).decorate
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end
end
