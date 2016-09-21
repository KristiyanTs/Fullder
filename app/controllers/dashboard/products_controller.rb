# frozen_string_literal: true
class Dashboard::ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_product, only: [:show, :update, :edit, :destroy]

  def index
    @products = @restaurant.products.search(params[:search])
                           .page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @products }
      format.js { render partial: 'index' }
    end
  end

  def show
  end

  def new
    @product = @restaurant.products.build
    @categories = @restaurant.categories

    respond_to do |format|
      format.js { render partial: 'form.js.coffee' }
    end
  end

  def edit
    @categories = @restaurant.categories

    respond_to do |format|
      format.js { render partial: 'form.js.coffee' }
    end
  end

  def create
    @product = @restaurant.products.new(product_params)

    respond_to do |format|
      if @product.save
        @products = @restaurant.products.page(params[:page])
        format.html do
          redirect_to dashboard_restaurant_products_path(@restaurant),
                      notice: 'Product was successfully added.',
                      status: :created
        end
        format.js 
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html do
          redirect_to dashboard_restaurant_products_path(@restaurant),
                      notice: 'Product was successfully updated.',
                      status: :ok
        end
        format.js do
          render js: "window.location = #{dashboard_restaurant_products_path(@restaurant).to_json}",
                 notice: 'Product was successfully updated.',
                 status: :ok
        end
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, flash: { notice: 'Product was successfully destroyed.' } }
      format.json { head :no_content }
      format.js do
        render js: "window.location = #{dashboard_restaurant_products_path(@restaurant).to_json}",
               notice: 'Product was successfully destroyed.',
               status: :ok
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def set_product
    @product = @restaurant.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :short_description, :description, :price,
                                    :category_id, :avatar, :tag_list, :allergen_list,
                                    sizes_attributes: [:id, :name, :price, :description, :product_id, :_destroy],
                                    groups_attributes: [:id, :name, :maximum, :product_id, :_destroy,
                                                        options_attributes: [:id, :name, :group_id, :_destroy]])
  end
end
