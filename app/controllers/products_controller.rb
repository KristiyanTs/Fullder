class ProductsController < ApplicationController
  before_action :set_restaurant
  before_action :set_product

  def show
    @order_item = OrderItem.new
    session[:restaurant_id] = @restaurant.id
    session[:product_id] = @product.id
    add_breadcrumb "product", restaurant_product_path(@restaurant, @product), title: "Back to the product"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_product
    @product = @restaurant.products.find(params[:id])
  end
end
