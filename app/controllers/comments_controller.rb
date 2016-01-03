class CommentsController < ApplicationController
  def create
    @course = Course.find params[:course_id]
    @comment = @course.comments.create! comment_params
    render partial: "comment", locals: {comment: @comment}
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
