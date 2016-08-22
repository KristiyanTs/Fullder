class DashboardsController < ApplicationController
  include DashboardsHelper

  def show
    render 'dashboard/show'
  end
end
