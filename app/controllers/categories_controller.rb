# frozen_string_literal: true
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @restaurant.categories
  end

  def show
    @products = @category.products.page(params[:page])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_category
    @category = @restaurant.categories.find(params[:id])
  end
end
