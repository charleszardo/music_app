class UsersController < ApplicationController
  before_action :require_no_login, only: [:new, :create]
  before_action :require_login, only: [:index]

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
      render :new
    end
  end
end
