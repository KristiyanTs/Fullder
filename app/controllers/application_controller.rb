require "application_responder"
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :set_locale
  include CanCan::ControllerAdditions # When using rails-api, you have to manually include the controller methods for CanCan

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def current_order
    if !session[:order_id].nil? && Order.exists?(session[:order_id])
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  # derive the model name from the controller. egs UsersController will return User
  def self.permission
    name = begin
      self.name.gsub('Controller', '').singularize.split('::').last.constantize.name
    rescue
      nil
    end
  end

  def current_user_permissions
    current_user.roles.find(restaurant_id: current_restaurant).permissions
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  # load the permissions for the current user so that UI can be manipulated
  def load_permissions
    @current_permissions = current_user.role.permissions.collect { |i| [i.subject_class, i.action] }
  end

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
