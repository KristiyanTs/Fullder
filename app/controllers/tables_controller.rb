class TablesController < ApplicationController
  before_action :set_restaurant
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  def index
    @tables = @restaurant.tables
  end

  def show
  end

  def new
    @table = Table.new
  end

  def edit
  end

  def create
    @table = @restaurant.tables.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to restaurant_tables_path(@restaurant), notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_table
    @table = @restaurant.tables.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:number, :capacity, :description, :available, :restaurant_id)
  end
end
