class CartsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_cart, only: [:show, :destroy]

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @restaurant = Restaurant.find(cart_params[:restaurant_id])
    @active_menu = @restaurant.menus.find_by(active: true)
    @user = current_user

    @user.create_cart(cart_params)

    if @user.save
      redirect_to restaurant_menu_path(@restaurant, @active_menu)
    else
      redirect_to @restaurant
    end
  end

  def destroy
    @cart.destroy
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def cart_params
    params.require(:cart).permit(:restaurant_id, :table_number, :user_id)
  end
end
