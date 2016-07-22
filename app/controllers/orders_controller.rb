# frozen_string_literal: true
class OrdersController < ApplicationController
  include OrdersHelper

  before_action :authenticate_user!
  before_action :set_create_order_params, only: [:create]
  before_action :set_update_order_params, only: [:update]

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    delete_unpaid_orders
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        session[:order_id] = @order.id
        format.html { redirect_to restaurant_categories_path(@restaurant) }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_order.update(order_params)
        session[:order_id] = current_order.id
        format.html { redirect_to restaurant_product_path(order_restaurant, session[:product_id]) }
        format.json { render :show, status: :ok, location: order_restaurant }
      else
        format.html { render :edit }
        format.json { render json: current_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_order.order_items.destroy_all
    @order_items = current_order.order_items
  end

  def pay
    @restaurant = current_order.restaurant
    current_order.update(order_status_id: 3)
    session[:order_id] = nil
    redirect_to restaurant_path(@restaurant)
  end

  private

  def order_params
    params.require(:order).permit(:table_id, :restaurant_id, :user_id)
  end

  def set_create_order_params
    @restaurant = Restaurant.find(session[:restaurant_id])
    params[:order][:restaurant_id] = @restaurant.id
    params[:order][:table_id] = @restaurant.tables.find_by(number: params[:table_number]).id
    params[:order][:user_id] = current_user.id
  end

  def set_update_order_params
    params[:order][:table_id] = order_restaurant.tables.find_by(number: params[:table_number]).id
    params[:order][:user_id] = current_user.id
    params[:order][:restaurant_id] = order_restaurant.id
  end
end
