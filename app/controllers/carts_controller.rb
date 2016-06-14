class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @user = current_user
    @user.create_cart(cart_params)
    if @user.save
      @restaurant = Restaurant.find(cart_params[:restaurant_id])
      @active_menu = @restaurant.menus.find_by(active: true)
      redirect_to restaurant_menu_path(@restaurant, @active_menu)
    else
      redirect_to
    end
  end

  def destroy
    @user = current_user
    @user.cart.destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:restaurant_id, :table_number, :user_id)
  end
end
