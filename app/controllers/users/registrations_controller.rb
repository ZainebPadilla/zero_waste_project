# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update, :destroy]

  #methodde to confirm destroy an account by adding password confirmation
   def destroy
    if params[:current_password].present? && current_user.valid_password?(params[:current_password])
      super
    else
      flash[:alert] = "Le mot de passe actuel est incorrect."
      redirect_to edit_user_registration_path
    end
   end

  protected #ensure that configure_account_update_params is accessible only within the controller or its subclasses, but not as public actions

  # the :current_password parameter is added to the permitted parameters for Devise's account_update action
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:current_password])
  end

  
  def after_sign_up_path_for(resource)
    root_path
  end

end
