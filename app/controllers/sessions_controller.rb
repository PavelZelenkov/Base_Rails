class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or tests_path
    else
      allert_flash_helper
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:forwarding_url) # для эксперимента, на случай аутентификации второго пользователя
    redirect_to login_path
  end

  private

  def redirect_back_or(default) # перенаправление для нужную страницу после логина
    redirect_to(cookies[:forwarding_url] || default)
    cookies.delete(:forwarding_url)
  end
  
end
