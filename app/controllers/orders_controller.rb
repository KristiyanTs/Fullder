class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    current_order = current_user.orders.new
    session[:order_id] = current_order.id
  end

  def edit
  end

  def create
    @restaurant = Restaurant.find(session[:restaurant_id])
    current_order.restaurant_id = @restaurant.id
    current_order.table_id = @restaurant.tables.find_by(number: params[:order][:table_id]).id

    respond_to do |format|
      if current_order.save
        session[:order_id] = current_order.id
        format.html { redirect_to restaurant_categories_path(@restaurant) }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: current_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @restaurant = current_order.restaurant
    params[:order][:table_id] = @restaurant.tables.find_by(number: params[:order][:table_id]).id

    respond_to do |format|
      if current_order.update(order_params)
        session[:order_id] = current_order.id
        format.html { redirect_to restaurant_product_path(@restaurant, session[:product_id]) }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: current_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:table_id)
  end
end
