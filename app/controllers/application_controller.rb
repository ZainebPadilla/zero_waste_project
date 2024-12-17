class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  #Devise's default method to define where the user is redirected after signing in
   def after_sign_in_path_for(resource)
    user_dashboard_path 
   end
end
#allows Devise to accept the first_name parameter during user sign-up 
def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
end