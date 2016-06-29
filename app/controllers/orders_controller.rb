class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :set_meal_params

  def new
    @order = Order.new
  end

  def create
    @order = @cart.orders.new(order_params)
    debugger
    respond_to do |format|
      if @order.save
        format.html { redirect_to restaurant_category_path(@restaurant, @category, menu_id: @menu), flash: { notice: 'Order was added to your cart.' } }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def set_order
    @order = @cart.orders.find(params[:id])
  end

  def set_meal_params
    @restaurant = Restaurant.find(current_user.cart.restaurant_id)
    @menu = @restaurant.menus.find_by(active: true)
    @category = @menu.categories.find(params[:category_id])
    @meal = @category.meals.find(params[:meal_id])
  end

  def order_params
    params.require(:order).permit(:restaurant_id, :quantity, :cart_id, :specifications, 
                                    :meal_id, :meal_size_id, supplemental_ids: [])
  end
end
