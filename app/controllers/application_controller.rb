class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def admin?
    current_user && current_user.is_admin?
  end

  def logged_in?
    !current_user.nil?
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

  def require_no_login
    if current_user
      redirect_to root_url
    end
  end

  def require_admin
    require_login
    unless current_user.is_admin?
      redirect_to root_url
    end
  end

  def require_owner
    item = Object.const_get(controller_name.classify).find(params[:id])
    unless item.is_owner?(current_user)
      redirect_to root_url
    end
  end
end
