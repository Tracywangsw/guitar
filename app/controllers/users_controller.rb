class UsersController < ApplicationController
  before_action :require_login?, only: [:show,:edit]
  def show
    if user_authorize?
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
    if user_authorize?
      @user = User.find(params[:id])
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # render :new
      redirect_to register_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      # render :edit
      redirect_to edit_user_path(current_user.id)
    end
  end

  def collect_course
    respond_to do |format|
      @user = User.find params[:id]
      @user.add_course params[:course_id]
      # format.js {}
      head :ok
    end
  end

  def remove_course
    respond_to do |format|
      @user = User.find params[:id]
      @user.remove_course params[:course_id].to_i
      # format.js {}
      head :ok
    end
  end

  def collect_score
    @user = User.find params[:id]
    @user.add_score params[:score_id]
    head :ok
  end

  def remove_score
    @user = User.find params[:id]
    @user.remove_score params[:score_id].to_i
    head :ok
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def user_authorize?
      if current_user.id.to_s == params[:id]
        true
      else
        false
      end
    end
end
