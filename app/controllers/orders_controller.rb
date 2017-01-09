class OrdersController < ApplicationController
  include OrdersHelper
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:new, :create, :pay]
  before_action :delete_unpaid_orders, only: [:create]

  def index
    @orders = current_user.orders.order('updated_at DESC').page(params[:page]).per(20)
    add_breadcrumb "orders", orders_path, title: "Back to the orders"
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.restaurant_id = @restaurant.id
    respond_to do |format|
      if @order.save
        @order_item = @restaurant.order_items.new(session[:order_item])
        @order.order_items << @order_item

        flash[:success] = "Item added to your cart."
        session[:order_id] = @order.id

        redirect_to restaurant_path(@restaurant, menu: "open") and return
      else
        format.html { render :new }
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
    respond_to do |format|
      if current_order.fulfils_requirements?
        @restaurant = current_order.restaurant
        current_order.update(payed: true)
        current_order.order_items.update_all(status: 'unready', received_at: Time.current)
        session[:order_id] = nil
        flash[:success] = "Order sent to restaurant."
        format.html { redirect_to restaurant_path(@restaurant)}
      else
        flash[:error] = "The requirements are not met."
        format.html { redirect_to @restaurant}
      end
    end

  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(session[:restaurant_id])
  end

  def order_params
    params.require(:order).permit(:table_number, :restaurant_id, :user_id, :table_id, :address)
  end
end
