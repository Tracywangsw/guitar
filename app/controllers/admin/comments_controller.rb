class Admin::CommentsController < Admin::ApplicationController
  def index
    @courses = Course.all
  end

  def block
    @comment = Comment.find params[:id]
    @comment.update! is_blocked: true
    render partial: "admin/courses/comment", locals: {comment: @comment}
  end

  def unblock
    @comment = Comment.find params[:id]
    @comment.update! is_blocked: false
    render partial: "admin/courses/comment", locals: {comment: @comment}
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    head :ok
  end
end
