class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def redirect_back_or(default) # перенаправление для нужную страницу после логина
    redirect_to(cookies[:forwarding_url] || default)
    cookies.delete(:forwarding_url)
  end
  
end
