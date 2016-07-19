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
        end
      end

      can :read, Product
      can :read, Category
    end
  end
end
