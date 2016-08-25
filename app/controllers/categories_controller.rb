class CategoriesController < ApplicationController
  before_action :set_restaurant
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @restaurant.categories.where(supercategory_id: nil)
  end

  def show
    @subcategories = @category.subcategories.page(params[:page])
    @products = @category.products.page(params[:page])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_category
    @category = @restaurant.categories.friendly.find(params[:id])
  end
end
