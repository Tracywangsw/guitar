class CommentsController < ApplicationController
  def create
    @user = User.find session[:user_id]
    insert_params = comment_params
    insert_params[:user_id] = session[:user_id]
    if params[:course_id]
      @course = Course.find params[:course_id]
      @course.comments.create! insert_params
      @comments = @course.comments.unblocked
    elsif params[:column_id]
      @column = Column.find params[:column_id]
      @column.comments.create! insert_params
      @comments = @column.comments.unblocked
    end
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
