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

  # protected
 
  # #derive the model name from the controller. egs UsersController will return User
  # def self.permission
  #   return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  # end
 
  # def current_ability
  #   @current_ability ||= Ability.new(current_user)
  # end
 
  # #load the permissions for the current user so that UI can be manipulated
  # def load_permissions
  #   @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  # end
end
