class SessionsController < ApplicationController
  before_action :require_no_login, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params)

    if user
      login_user!(user)

      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to root_url
  end
end
