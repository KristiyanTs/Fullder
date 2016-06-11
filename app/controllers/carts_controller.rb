class CartsController < ApplicationController
  def show
  end

  def new
    @cart = Cart.net
  end

  def create
    @user = current_user
    @user.create_cart(params[:cart])
  end

  def destroy
    @user = current_user
    @user.cart.destroy
    @user.save # do we need this?
  end

  private

  def cart_params
    params.require(:cart).permit(:restaurant_id, :table_number, :user_id)
  end
end
