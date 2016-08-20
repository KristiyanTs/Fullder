# frozen_string_literal: true
class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_product

  def show
    @order_item = current_order.order_items.new
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_product
    @product = @restaurant.products.find(params[:id])
  end
end
