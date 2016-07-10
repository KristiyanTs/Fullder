class PositionsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_position, only: [:show, :edit, :destroy]

  def index 
    @positions = @restaurant.positions
  end

  def show
  end

  def new
    @position = @restaurant.positions.build
    @roles = @restaurant.roles
  end

  def edit  
    @roles = @restaurant.roles
    @editing = true
  end

  def create
    @employee = User.find_by(email: params[:email])
    params[:position][:user_id] = @employee.id

    @position = @restaurant.positions.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to restaurant_position_path(@restaurant, @position), flash: { notice: 'Employee was successfully added.' } }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to @position, flash: { notice: 'Position was successfully updated.' } }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_positions_path(@restaurant), flash: { notice: 'Employee was successfully removed.' } }
      format.json { head :no_content }
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_position
    @position = @restaurant.positions.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:role_id, :user_id)
  end

end
