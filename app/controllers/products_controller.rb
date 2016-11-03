class ProductsController < ApplicationController
  before_action :set_restaurant
  before_action :set_product

  def show
    @order_item = OrderItem.new
    session[:restaurant_id] = @restaurant.id
    session[:product_id] = @product.id

    add_breadcrumb @restaurant.name, restaurant_path(@restaurant), title: "Back to the restaurant"
    add_breadcrumb "menu", restaurant_categories_path(@restaurant), title: "Back to menu"
    add_breadcrumb @product.name, restaurant_product_path(@restaurant, @product)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_product
    @product = @restaurant.products.find(params[:id])
  end
end
