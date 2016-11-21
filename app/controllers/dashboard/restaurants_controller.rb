# frozen_string_literal: true
class Dashboard::RestaurantsController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :authenticate_user!
  before_action :set_restaurant, except: [:create, :new, :import]

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
        format.html do
          redirect_to edit_dashboard_restaurant_path(@restaurant),
                      flash: { notice: 'Restaurant was successfully created.' }
        end
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    upload = params[:file]
    logger.debug "STARTING TO IMPORT FILE IN RESTAURANT'S CONTROLLER, THE FILE IS #{Rails.root.join('tmp/menu_import', upload.original_filename)}"
    File.open(Rails.root.join('tmp/menu_import', upload.original_filename), 'wb') do |file|
      file.write(upload.read)
    end

    logger.debug "STARTING TO IMPORT FILE IN RESTAURANT #{params[:restaurant_id]}"
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
    MenuImportWorker.perform_async(@restaurant.id, upload.original_filename)
    redirect_to dashboard_restaurant_path(@restaurant),
                notice: 'File was uploaded successfully and is being processed.'
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
    @restaurant = Restaurant.friendly.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :tag_list, :country, :address, :description, :phone_number, :wifipassword,:avg_meal_price, 
                                      :staff_count, :facebook_link,
                                      :twitter_link, :available_payment,
                                      :accepts_deliveries, :accepts_reservations, :sells_online,
                                      :restaurant_avatar, language_ids: [],
                                      working_times_attributes: [:id, :from_time, :to_time, :from_day, :to_day, :restaurant_id, :_destroy],
                                      images_attributes: [:id, :pic, :restaurant_id, :_destroy])
  end
end
