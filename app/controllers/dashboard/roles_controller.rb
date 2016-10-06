# frozen_string_literal: true
class Dashboard::RolesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_role, except: [:index, :create, :new]

  def index
    @roles = @restaurant.roles
    @roles = @roles.search(params[:search]).page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @roles }
      format.js { render partial: 'index' }
    end
  end

  def show
  end

  def new
    @role = @restaurant.roles.build

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
    @role = @restaurant.roles.new(role_params)

    respond_to do |format|
      if @role.save
        format.html do
          redirect_to dashboard_restaurant_roles_path(@restaurant),
                      notice: 'Role was successfully created.',
                      status: :created
        end
        format.js
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html do
          redirect_to dashboard_restaurant_roles_path(@restaurant),
                      notice: 'Role was successfully updated.',
                      status: :ok
        end
        format.js
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      @role.destroy
      format.html { redirect_to dashboard_restaurant_roles_path(@restaurant) }
      format.js
    end
  end

  private

  def set_role
    @role = @restaurant.roles.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end

  def role_params
    params.require(:role).permit(:name, :restaurant_id,
                                 permission_ids: [])
  end
end
