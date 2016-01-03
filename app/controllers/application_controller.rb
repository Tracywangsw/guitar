class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include HelperMethod

  helper_method :login?, :current_user, :default_username

  def current_user
    @current_user = User.find session[:user_id]
  end

  def default_username
    if not current_user.username
      name = "guitar"
    else
      current_user.username
    end
  end

  def login?
    session[:user_id]
  end

protected
  def require_login?
    unless login?
      redirect_to login_path
    end
  end

end
