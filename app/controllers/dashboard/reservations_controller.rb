class Dashboard::ReservationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = @restaurant.reservations
                               .search(params[:search])
                               .page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @reservations }
      format.js { render partial: 'index' }
    end
  end

  def show
  end

  def new
    @reservation = @restaurant.reservations.build

    respond_to do |format|
      format.js { render partial: 'form.js.coffee' }
    end
  end

  def edit
    @tables = @restaurant.tables
    
    respond_to do |format|
      format.js { render partial: 'form.js.coffee' }
    end
  end

  def create
    @reservation = @restaurant.reservations.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        
        @reservation.update(confirmed: true)

        format.html do
          redirect_to dashboard_restaurant_reservations_path(@restaurant),
                      notice: 'Reservation was successfully created.',
                      status: :created
        end
        format.js
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @reservations = @restaurant.reservations.page(params[:page])
    respond_to do |format|
      if @reservation.update(reservation_params)
        ReservationMailer.confirmed_reservation(@reservation.user, @restaurant, @reservation).deliver_now if
              @reservation.user
        @reservation.update(confirmed: true)
        format.html do
          redirect_to dashboard_restaurant_reservations_path(@restaurant),
                      notice: 'Reservation was successfully updated.',
                      status: :ok
        end
        format.js 
      else
        format.html { render :edit }
        format.json { render json: @reservations.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_restaurant_reservations_path, flash: { notice: 'Reservation was successfully removed.' } }
      format.json { head :no_content }
      format.js
    end
  end

  def update_available_tables
    debugger
    @tables = @restaurant.tables.all
    if params[:start_time] && params[:duration]
      @tables = @restaurant.tables
    end
    respond_to do |format|
      format.html 
      format.json
      format.js
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_reservation
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :seats, 
                                        :contact_number, :contact_name, :requirements, :duration,
                                        {table_ids: []})
  end
end
