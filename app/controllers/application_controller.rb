class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :authenticate_customer!, if: :public_url, except: [:top, :index]
   before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  def public_url
     request.fullpath.include?("/public")
  end

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

  private

    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
          admin_users_path
      else
        root_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :user
        root_path
      elsif resource_or_scope == :admin
        root_path
      else
        root_path
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end