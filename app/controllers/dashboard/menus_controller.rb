# frozen_string_literal: true
class Dashboard::MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant

  def show

  end

  def import
    upload = params[:file]
    File.open(Rails.root.join('tmp/menu_import', upload.original_filename), 'wb') do |file|
      file.write(upload.read)
    end

    MenuImportWorker.perform_async(@restaurant.id, upload.original_filename)
    redirect_to dashboard_restaurant_path(@restaurant),
                notice: 'File was uploaded successfully and is being processed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end
end
