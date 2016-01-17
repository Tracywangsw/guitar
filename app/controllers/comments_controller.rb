class CommentsController < ApplicationController
  def create
    @user = User.find session[:user_id]
    @course = Course.find params[:course_id]
    insert_params = comment_params
    insert_params[:user_id] = session[:user_id]
    @course.comments.create! insert_params
    @comments = @course.comments.unblocked
    respond_to do |format|
     format.js
    end
    # render partial: "comment", locals: {comments: @course.comments.unblocked}
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
