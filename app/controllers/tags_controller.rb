class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find params[:id]
    @columns = @tag.columns
    @courses = @tag.courses
  end
end
