class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params)

    if user
      login_user!(user)

      redirect_to root_url
    else
      flash[:errors] = "Invalid credentials"
      redirect_to root_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to root_url
  end
end
