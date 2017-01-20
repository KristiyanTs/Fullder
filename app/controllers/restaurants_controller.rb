# frozen_string_literal: true
class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite]
  before_action :set_restaurant, only: [:show, :favorite]

  def index
    # Checking if called by pagination or by a new search
    @nextpage = params[:scrolling]
    params[:scrolling] = false
    
    @latitude = params[:latitude] || request.location.try(:latitude) || 0
    @longitude = params[:longitude] || request.location.try(:longitude) || 0
    
    @restaurants = Restaurant.search(params[:search])
    @restaurants = @restaurants.by_distance(origin: [@latitude, @longitude]) if @latitude && @longitude
    @restaurants = @restaurants.page(params[:page]).per(12)

    ahoy.track "Viewed restaurants index"

    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
      format.js
    end
  end

  def show
    session[:restaurant_id] = @restaurant.id
    @hash = Gmaps4rails.build_markers(@restaurant) do |res, marker|
      marker.lat res.latitude
      marker.lng res.longitude
    end

    @categories = @restaurant.categories.where(supercategory_id: nil).order(:index)
    @order_item = OrderItem.new

    add_breadcrumb @restaurant.name, restaurant_path(@restaurant), title: "Back to the restaurant"
    ahoy.track "Viewed restaurant home page", restaurant_id: @restaurant.id

    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:id])
  end
end