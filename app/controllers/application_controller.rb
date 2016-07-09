class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  include CanCan::ControllerAdditions #When using rails-api, you have to manually include the controller methods for CanCan

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to restaurant_path(1), alert: exception.message
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_restaurant
    if !session[:restaurant_id].nil?
      session[:restaurant_id]
    else
      redirect_to root_path, notice: 'Where would you like to eat?'
    end
  end

  # derive the model name from the controller. egs UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  end

  def current_user_permissions
    current_user.roles.find(restaurant_id: current_restaurant).permissions
  end
 
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
 
  #load the permissions for the current user so that UI can be manipulated
  def load_permissions
    @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  end
end
