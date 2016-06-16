class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
    "#{first_name.first}. #{last_name}"
  end

end