class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

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
      format.js { render partial: 'index.erb.js'}
    end
  end

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
        format.html { redirect_to @restaurant, flash: { notice: 'Restaurant was successfully created.' } }
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
        format.html { redirect_to @restaurant, flash: { notice: 'Restaurant was successfully updated.' } }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, flash: { notice: 'Restaurant was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :phone_number, :restaurant_avatar)
  end
end
