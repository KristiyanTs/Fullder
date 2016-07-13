class TablesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_table, only: [:show, :edit, :destroy]

  def index
    @tables = @restaurant.tables.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @table = @restaurant.tables.build

    respond_to do |format|
      format.js { render partial: 'form.js.coffee' }
    end
  end

  def edit
    respond_to do |format|
      format.js { render partial: 'form.js.coffee' }
    end
  end

  def create
    @table = @restaurant.tables.new(table_params)

    respond_to do |format|
      if @table.save
        format.html do
          redirect_to restaurant_tables_path(@restaurant),
                      notice: 'Table was successfully created.',
                      status: :created
        end
        format.js do
          render js: "window.location = #{restaurant_tables_path(@restaurant).to_json}",
                 notice: 'Table was successfully created.',
                 status: :created
        end
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html do
          redirect_to restaurant_tables_path(@restaurant),
                      notice: 'Table was successfully updated.',
                      status: :ok
        end
        format.js do
          render js: "window.location = #{restaurant_tables_path(@restaurant).to_json}",
                 notice: 'Table was successfully updated.',
                 status: :ok
        end
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_tables_path, flash: { notice: 'Table was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  def claim
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_table
    @product = @restaurant.tables.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:number)
  end
end
