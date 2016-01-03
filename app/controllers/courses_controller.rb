class CoursesController < ApplicationController
  def index
    @level = params[:level] || :level_low
    @level = @level.to_sym
    @courses = Course.send @level
  end

  def show
    @course = Course.find params[:id]
  end
end
