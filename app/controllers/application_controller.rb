class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :redirection_by_user_type

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title])
  end

  def redirection_by_user_type
    if current_user.is_a?(Admin)
      redirect_to admin_tests_path
    else
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

end
