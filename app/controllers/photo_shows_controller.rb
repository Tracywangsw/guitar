class PhotoShowsController < ApplicationController
  def index
    @photos = PhotoShow.all
  end

  def show
    @photo = PhotoShow.find params[:id]
  end

end