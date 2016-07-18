class DashboardsController < ApplicationController
  include DashboardsHelper
  def show
    @restaurant = Restaurant.find(params[:restaurant_id]|| current_user.positions.first.restaurant_id)
  end
end
