class UsersController < ApplicationController
  def index
    @users = User.all

    render :index
  end

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      redirect_to users_url
    else
      render json: @user.errors.full_messages
    end
  end
end
