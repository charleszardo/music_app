class UsersController < ApplicationController
  before_action :require_no_login, only: [:new, :create]
  before_action :require_admin, only: [:index]

  def make_admin
    @user = User.find(params[:id])
    @user.make_admin
    @user.save

    redirect_to users_url
  end

  def revoke_admin
    @user = User.find(params[:id])
    @user.revoke_admin
    @user.save

    redirect_to users_url
  end

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
      redirect_to root_url
    else
      render :new
    end
  end
end
