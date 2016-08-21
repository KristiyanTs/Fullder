# frozen_string_literal: true
class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :favorite]

  def index
    @user_location = request.location

    # The following code will not work in a localhost. Uncomment for production
    @restaurants =
      if @user_location.blank?
        Restaurant.all
      else
        Restaurant.near([@user_location.latitude, @user_location.longitude],
                        50,
                        order: :distance)
      end

    @restaurants = @restaurants.search_word(params[:search]) if params[:search]
    @restaurants = @restaurants.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
      format.js { render partial: 'index' }
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
    if type == 'favorite'
      current_user.favorite_restaurants << @restaurant
    else
      current_user.favorite_restaurants.delete(@restaurant)
    end

    respond_to do |format|
      format.html
      format.js { render partial: 'favorite.js.erb' }
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
