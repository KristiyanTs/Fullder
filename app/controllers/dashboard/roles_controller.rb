# frozen_string_literal: true
class Dashboard::RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_role, except: [:index, :create, :new]

  def index
    @search = @restaurant.roles.search(params[:q])
    @roles = @search.result.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @roles }
      format.js { render partial: 'index.erb.js' }
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
        format.js do
          render js: "window.location = #{dashboard_restaurant_roles_path(@restaurant).to_json}",
                 notice: 'Role was successfully created.',
                 status: :created
        end
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
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
        format.js do
          render js: "window.location = #{dashboard_restaurant_roles_path(@restaurant).to_json}",
                 notice: 'Role was successfully updated.',
                 status: :ok
        end
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @role.positions.any?
      @role.errors.add(:name, " is currenlty assigned to an employee. Please, reassign first.")
    else
      @role.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_restaurant_roles_path(@restaurant), flash: { notice: 'Role was successfully destroyed.' } }
        format.json { head :no_content }
        format.js do
          render js: "window.location = #{dashboard_restaurant_roles_path(@restaurant).to_json}",
                 notice: 'Role was successfully destroyed.',
                 status: :ok
        end
      end
    end
  end

  private

  def set_role
    @role = @restaurant.roles.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def role_params
    params.require(:role).permit(:name, :restaurant_id,
                                 permission_ids: [])
  end
end
