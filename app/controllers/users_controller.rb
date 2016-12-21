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
      msg = UserMailer.activation_email(@user)
      msg.deliver_now
      flash[:notice] = "Successfully created your account! Check your inbox for an activation email."
      redirect_to root_url
    else
      render :new
    end
  end

  def activate
    user = User.find_by_activation_token(params[:activation_token])
    if user
      user.activated = true
      login_user!(user)
      redirect_to root_url
    else
      flash[:errors] = "Invalid activation token"
      redirect_to root_url
    end
  end
end
