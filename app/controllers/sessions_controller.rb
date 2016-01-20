class SessionsController < ApplicationController

  def new
    # puts "!!!login"
    render "new"
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.is_frozen
        redirect_to login_path
      else
        session[:user_id] = user.id
        # THERE IS A PROBLEM: TWO REQUEST PER ACTION!!!
        # redirect_to :back
        # rescue ActionController::RedirectBackError
        #   redirect_to root_path
        # end
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
