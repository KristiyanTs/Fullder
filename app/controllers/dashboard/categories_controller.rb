# frozen_string_literal: true
class Dashboard::CategoriesController < ApplicationController
  load_and_authorize_resource find_by: :slug

  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @restaurant.categories
    @categories = @categories.search(params[:search])
    @categories = @categories.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @categories }
      format.js { render partial: 'index' }
    end
  end

  def show
    @products = @category.products.page(params[:page])
  end

  def new
    @category = @restaurant.categories.build
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
    @category = @restaurant.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to dashboard_restaurant_categories_path(@restaurant),
                      notice: 'Category was successfully created.',
                      status: :created
        end
        format.js 
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to dashboard_restaurant_categories_path(@restaurant),
                      notice: 'Category was successfully updated.',
                      status: :ok
        end
        format.js
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_restaurant_categories_path(@restaurant), flash: { notice: 'Category was successfully destroyed.' } }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_category
    @category = @restaurant.categories.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :age_restriction, :available_all_day, :avatar, :supercategory_id)
  end
end
