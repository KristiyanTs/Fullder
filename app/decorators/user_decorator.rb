# frozen_string_literal: true
class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
    "#{first_name}. #{last_name}"
  end
end
