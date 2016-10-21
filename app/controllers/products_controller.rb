class ProductsController < ApplicationController
  before_action :set_restaurant
  before_action :set_product

  def show
    @order_item = OrderItem.new
    session[:restaurant_id] = @restaurant.id
    session[:product_id] = @product.id
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_product
    @product = @restaurant.products.find(params[:id])
  end
end
