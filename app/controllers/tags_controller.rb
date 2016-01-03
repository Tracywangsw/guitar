class TagsController < ApplicationController
  def index
    @tags = Tag.all.first(10)
  end

  def show
    @tag = Tag.find params[:id]
    @columns = @tag.columns
    @courses = @tag.courses
  end
end
