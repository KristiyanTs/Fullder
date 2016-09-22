# frozen_string_literal: true
class Dashboard::TablesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_table, only: [:show, :edit, :destroy]

  def index
    @tables = @restaurant.tables
                         .search(params[:search])
                         .page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @tables }
      format.js { render partial: 'index' }
    end
  end

  def show
    @reservations = @table.reservations.page(params[:page])
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
          redirect_to dashboard_restaurant_tables_path(@restaurant),
                      notice: 'Table was successfully created.',
                      status: :created
        end
        format.js do
          render js: "window.location = #{dashboard_restaurant_tables_path(@restaurant).to_json}",
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
          redirect_to dashboard_restaurant_tables_path(@restaurant),
                      notice: 'Table was successfully updated.',
                      status: :ok
        end
        format.js do
          render js: "window.location = #{dashboard_restaurant_tables_path(@restaurant).to_json}",
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
      format.html { redirect_to dashboard_restaurant_tables_path, flash: { notice: 'Table was successfully removed.' } }
      format.json { head :no_content }
      format.js do
        render js: "window.location = #{dashboard_restaurant_tables_path(@restaurant).to_json}",
               notice: 'Table was successfully removed.',
               status: :ok
      end
    end
  end

  def claim
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_table
    @table = @restaurant.tables.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:number, :capacity)
  end
end
