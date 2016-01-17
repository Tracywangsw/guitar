class CoursesController < ApplicationController
  def index
    # @level = params[:level] || :level_low
    # @level = @level.to_sym
    # @courses = Course.send @level
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @comments = @course.comments.unblocked
    @score = @course.score
  end
end
