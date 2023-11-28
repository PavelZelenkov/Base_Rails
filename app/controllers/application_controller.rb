class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?,
                :allert_flash_helper

  private

  def authenticate_user!
    cookies[:forwarding_url] = request.url if request.get? # сохрание для перенаправления пользователя 

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

  def allert_flash_helper # хелпер для flash сообщений
    flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
  end

end
