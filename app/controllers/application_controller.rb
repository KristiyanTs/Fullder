class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  include CanCan::ControllerAdditions #When using rails-api, you have to manually include the controller methods for CanCan

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
