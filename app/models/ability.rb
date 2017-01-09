# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      user.roles.each do |role|
        role.permissions.each do |permission|
          can permission.action.to_sym, permission.subject_class.constantize, restaurant_id: role.restaurant_id
          can permission.action.to_sym, permission.subject_class.constantize, id: role.restaurant_id if permission.subject_class == "Restaurant"
        end
      end
      can [:edit, :update, :destroy, :pay], Order, user_id: user.id, payed: false
      can :read, Restaurant
      can :read, Product
      can :read, Category
      can [:read, :create], Reservation
      can [:create, :pay], Order
    end
  end
end
