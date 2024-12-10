class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

   # Devise: Redirige après la connexion
   def after_sign_in_path_for(resource)
    # Exemple : Redirection vers la page de tableau de bord
    user_dashboard_path # Remplacez par le chemin souhaité
   end
end
def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
end