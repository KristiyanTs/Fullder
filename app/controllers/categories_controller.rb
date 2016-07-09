class CategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @restaurant.categories
  end

  def show
    @products = @category.products
  end

  def new
    @category = @restaurant.categories.build
  end

  def edit
  end

  def create
    @category = @restaurant.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to restaurant_category_path(@restaurant, @category), flash: { notice: 'Category was successfully created.' } }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, flash: { notice: 'Category was successfully updated.' } }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, flash: { notice: 'Category was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_category
    @category = @restaurant.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :age_restriction, :available_all_day, :category_avatar)
  end
end
