class CartsController < ApplicationController
  def show
  end

  def create
    @user = current_user
    @user.create_cart(cart_params)
  end

  def new
    @cart = Cart.net
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
