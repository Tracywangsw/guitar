class Admin::ApplicationController < ActionController::Base
  layout "admin"

  before_action :require_login
  include HelperMethod

  helper_method :login?

  def require_login
    redirect_to admin_login_path unless session[:is_admin]
  end

  def login?
    session[:is_admin]
  end

end
