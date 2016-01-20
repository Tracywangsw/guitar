class ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.find params[:id]
    @comments = @column.comments.unblocked
    @pictures = @column.images
  end
end
