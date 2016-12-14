class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params)

    if user
      login_user!(user)
    else
      flash[:errors] = "Invalid credentials"
      redirect_to root_url
    end
  end
end
