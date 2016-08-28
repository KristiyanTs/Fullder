# frozen_string_literal: true
class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite]
  before_action :set_restaurant, only: [:show, :favorite]

  def index
    @user_location = request.location

    @restaurants =
      if params[:search].blank?
        Restaurant.all
      else
        Restaurant.search_word(params[:search])
      end

    @restaurants = @restaurants.by_distance(origin: [@user_location.latitude, @user_location.longitude]) if !@user_location.blank?
    @restaurants = @restaurants.page(params[:page]).per(15)

    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
      format.js { }
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
    @restaurant = Restaurant.friendly.find(params[:id])
  end
end
