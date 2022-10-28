class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        user_path(resource)
    end


    def after_sign_out_path_for(resource)
    sceneries_path
    end

    def log_in(user)
      session[:user_id] = user.id
    end

    def guest_user
      current_user == User.find_by(email: 'test@example.com')
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
