# frozen_string_literal: true
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password,
                                 :phone_number, :address, :locale, :allergen_list)
  end

  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if !current_user.password_required?
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  # Override redirect page after profile edit
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end
end
