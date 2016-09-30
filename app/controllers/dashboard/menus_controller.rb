# frozen_string_literal: true
class Dashboard::MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant

  def show

  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end
end
