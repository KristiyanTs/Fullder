# frozen_string_literal: true
module DashboardsHelper
  def should_see?(obj)
    (can? :read, obj) || (can? :edit, obj) || (can? :create, obj) || (can? :update, obj) || (can? :destroy, obj)
  end
end
