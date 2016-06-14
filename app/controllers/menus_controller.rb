class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = @restaurant.menus
  end

  def show
    @categories = @menu.categories
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = @restaurant.menus.new(menu_params)

    respond_to do |format|
      if @menu.save
        check_if_other_is_active(@menu, @restaurant.menus)
        format.html { redirect_to restaurant_menus_path(@restaurant), flash: { notice: 'Menu was successfully created.' } }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors.full_messages.join(','), status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to restaurant_menu_path(@restaurant, @menu), flash: { notice: 'Menu was successfully updated.' } }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_menus_path(@restaurant), flash: { notice: 'Menu was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  def activate
    @menu = @restaurant.menus.find(params[:menu_id])
    @menu.active = true
    respond_to do |format|
      if @menu.save
        check_if_other_is_active(@menu, @restaurant.menus)
        format.html { redirect_to restaurant_menus_path(@restaurant), notice: 'Menu was successfully activated.' }
        format.json { render :index, status: :created, location: @menus }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_menu
    @menu = @restaurant.menus.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :active)
  end

  def check_if_other_is_active(menu, menus)
    if menu.active
      menus.where(active: true).where.not(id: menu.id).update_all(active: false)
    end
  end
end
