# frozen_string_literal: true
class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show]

  def index
    @userLocation = request.location
    @search = Restaurant.search(params[:q])

    # The following code will not work in localhost. Uncomment for production
    # if @userLocation.present?
    #   @restaurants = @search.result.page(params[:page]).near([@userLocation.latitude, @userLocation.longitude], 50, order: :distance)
    # else
    #   @restaurants = @search.result.page(params[:page])
    # end

    @restaurants = @search.result.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
      format.js { render partial: 'index.erb.js' }
    end
  end

  def show
    session[:restaurant_id] = @restaurant.id
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
