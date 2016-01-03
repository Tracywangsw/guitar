class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if params[:username] == "guitar" && params[:password] == "guitar"
      session[:is_admin] = true
      redirect_to admin_path
    else
      redirect_to admin_login_path
    end
  end

  def destroy
    session.delete :is_admin
    redirect_to root_path
  end
end
