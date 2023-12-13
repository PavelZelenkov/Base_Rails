class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :set_locale

  def default_url_options
    I18n.locale != I18n.default_locale ? { lang: I18n.locale } : { lang: nil }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_surname])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      stored_location_for(resource) || tests_path
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
