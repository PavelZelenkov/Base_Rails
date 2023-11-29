class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  
  helper_method :current_user,
                :logged_in?,
                :allert_flash_helper

  private

  def authenticate_user!
    unless logged_in?
      cookies[:forwarding_url] = request.url if request.get?
    end

    unless current_user
      return redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
