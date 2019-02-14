class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? 
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name])
    end

private

  def require_login
    unless current_user
      redirect_to new_user_registration_path
    end
  end

end
