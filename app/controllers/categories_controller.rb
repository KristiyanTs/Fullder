class CategoriesController < ApplicationController
  before_action :set_restaurant
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @restaurant.categories.where(supercategory_id: nil)
    
    add_breadcrumb @restaurant.name, restaurant_path(@restaurant), title: "Back to the restaurant"
    add_breadcrumb "menu", restaurant_categories_path(@restaurant), title: "Back to menu"
  end

  def show
    @subcategories = @category.subcategories.page(params[:page])
    @products = @category.products.page(params[:page])
    @order_item = OrderItem.new
    session[:restaurant_id] = @restaurant.id

    add_breadcrumb @restaurant.name, restaurant_path(@restaurant), title: "Back to the restaurant"
    add_breadcrumb "menu", restaurant_categories_path(@restaurant), title: "Back to menu"
    add_breadcrumb @category.name, restaurant_category_path(@restaurant, @category), title: "Category"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_category
    @category = @restaurant.categories.friendly.find(params[:id])
  end
end
