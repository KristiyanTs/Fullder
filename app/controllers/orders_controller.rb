class OrdersController < ApplicationController
  include OrdersHelper
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:new, :create]
  before_action :delete_unpaid_orders, only: [:create]

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    params[:order][:user_id] = current_user.id

    @order = @restaurant.orders.new(order_params)
    respond_to do |format|
      if @order.save
        session[:order_id] = @order.id
        format.html { redirect_to restaurant_categories_path(params[:restaurant_id]) }
        format.json { render :show, status: :ok, location: params[:restaurant_id] }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      # params[:order][:restaurant_id] = current_order.restaurant_id
      # params[:order][:user_id] = current_user.id
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
    current_order.update(payed: true)
    current_order.order_items.update_all(status: 'unready', received_at: Time.now)
    session[:order_id] = nil
    redirect_to restaurant_path(@restaurant)
  end

  private
  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def order_params
    params.require(:order).permit(:table_number, :restaurant_id, :user_id, :table_id, :address)
  end
end
