class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def create
    @user = User.new user_params
    @user.is_admin = true
    if @user.save
      redirect_to admin_users_path
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def frozen
    @user = User.find(params[:id])
    if @user.is_frozen == false
      @user.update_attribute(:is_frozen, true)
    else
      @user.update_attribute(:is_frozen, false)
    end
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
