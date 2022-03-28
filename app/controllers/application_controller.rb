class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    def after_sign_in_path_for(resource)
        edit_profile_path(resource.id)
        
    end

    def after_sign_up_path_for(resource)
        edit_profile_path(resource.id)
    end

end
