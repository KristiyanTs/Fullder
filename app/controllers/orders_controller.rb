class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, except: [:new]

  def new
    @order = current_user.orders.new
    session[:order_id] = @order.id
  end

  def edit
  end

  def create
    @restaurant = Restaurant.find(session[:restaurant_id])
    @order.restaurant_id = @restaurant.id
    @order.table_id = @restaurant.tables.find_by(number: params[:order][:table_id]).id

    respond_to do |format|
      if @order.save
        format.html { redirect_to restaurant_categories_path(@restaurant) }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end    
  end

  def update
    @restaurant = @order.restaurant
    params[:order][:table_id] = @restaurant.tables.find_by(number: params[:order][:table_id]).id

    respond_to do |format|
      if @order.update(order_params)
        session[:order_id] = @order.id
        format.html { redirect_to restaurant_product_path(@restaurant, session[:product_id]) }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:table_id)
  end

  def set_order
    @order = current_order
  end 
end
