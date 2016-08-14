# frozen_string_literal: true
class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :favorite]

  def index
    @userLocation = request.location
    @search = Restaurant.search(params[:q])

    # The following code will not work in a localhost. Uncomment for production
    # if @userLocation.present?
    #   @restaurants = @search.result.page(params[:page]).near([@userLocation.latitude, @userLocation.longitude], 50, order: :distance)
    # else
    #   @restaurants = @search.result.page(params[:page])
    # end

    @restaurants = @search.result.includes(:tags).page(params[:page])
    

    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
      format.js { render partial: 'index.erb.js' }
    end
  end

  def show
    session[:restaurant_id] = @restaurant.id
    @hash = Gmaps4rails.build_markers(@restaurant) do |res, marker|
      marker.lat res.latitude
      marker.lng res.longitude
    end
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorite_restaurants << @restaurant
      respond_to do |format|
        format.html
        format.js { render partial: 'favorite.js.erb' }
      end
    else
      current_user.favorite_restaurants.delete(@restaurant)
      respond_to do |format|
        format.html
        format.js { render partial: 'favorite.js.erb' }
      end
    end

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
