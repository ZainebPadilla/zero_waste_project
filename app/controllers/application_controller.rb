class ApplicationController < ActionController::Base
  allow_browser versions: :modern
   def after_sign_in_path_for(resource)
    user_dashboard_path 
   end
end
def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
end