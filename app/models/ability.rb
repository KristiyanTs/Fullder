# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new

    can :manage, :all if user.admin?

    case controller_namespace
      when 'dashboard'

        can :read, Restaurant if user.positions.any? { |pos| id = pos.restaurant_id} 
        can :update, OrderItem if user.positions.any? { |pos| restaurant_id = pos.restaurant_id} 
        can :refresh_orders, OrderItem if user.positions.any? { |pos| restaurant_id = pos.restaurant_id}

        user.roles.each do |role|
          role.permissions.each do |permission|
            can permission.action.to_sym, permission.subject_class.constantize, restaurant_id: role.restaurant_id if permission.subject_class != "Restaurant"
            can permission.action.to_sym, permission.subject_class.constantize, id: role.restaurant_id if permission.subject_class == "Restaurant"
          end
        end
      else
        can [:read, :create, :edit, :update, :destroy, :pay], Order, user_id: user.id, payed: false
        can :read, Restaurant
        can :read, Product
        can :read, Category
    end
  end
end