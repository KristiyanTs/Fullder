# frozen_string_literal: true
class DashboardsController < ApplicationController
  include DashboardsHelper

  def show
    render 'dashboard/show'
  end
end
