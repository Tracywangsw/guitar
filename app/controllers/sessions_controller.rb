class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.is_frozen
        redirect_to login_path
      else
        session[:user_id] = user.id
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    @current_user = nil
    redirect_to login_path
  end

end
