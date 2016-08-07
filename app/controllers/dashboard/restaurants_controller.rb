# frozen_string_literal: true
class Dashboard::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, except: [:create]

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to edit_dashboard_restaurant_path(@restaurant), flash: { notice: 'Restaurant was successfully created.' } }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to edit_dashboard_restaurant_path(@restaurant), flash: { notice: 'Restaurant was successfully updated.' } }
        format.json { render :edit, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :tag_list, :address, :description, :phone_number, 
                                       :restaurant_avatar, :locale, :sells_online,
                                       working_times_attributes: [:id, :from_time, :to_time, :from_day, :to_day, :restaurant_id, :_destroy],
                                       images_attributes: [:id, :pic, :restaurant_id, :_destroy])
  end
end
