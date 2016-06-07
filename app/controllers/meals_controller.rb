class MealsController < ApplicationController
  before_action :set_restaurant
  before_action :set_menu
  before_action :set_category
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = @category.meals
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = @category.meals.new(meal_params)

    if @meal.save
      format.html { redirect_to restaurant_meals_path,
                    flash: { notice: @meal.name + ' meal was successfully created.' } }
      format.json { render :show, status: :created, location: @meal }
    else
      format.html { render :new }
      format.json { render json: @meal.errors, status: :unprocessable_entity }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      format.html { redirect_to restaurant_meals_path, flash: { notice: @meal.name + ' meal was successfully updated.' } }
      format.json { render :show, status: :ok, location: @meal }
    else
      format.html { render :edit }
      format.json { render json: @meal.errors, status: :unprocessable_entity }
    end
  end

  def destroy
  	@meal.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_category_path(@restarant, @category), flash: { notice: 'Meal was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :meal_avatar)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_menu
    @menu = @restaurant.menus.find(params[:menu_id])
  end

  def set_category
    @category = @menu.categories.find(params[:category_id])
  end

  def set_meal
    @meal = @category.meals.find(params[:id])
  end
end
