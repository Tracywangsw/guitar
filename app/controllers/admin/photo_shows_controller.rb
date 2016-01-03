class Admin::PhotoShowsController < Admin::ApplicationController
  def index
    @photos = PhotoShow.all
  end

  def new
    @photo = PhotoShow.new
  end

  def create
    photo_params[:images].each do |image|
      @photo = PhotoShow.new
      attachment = Attachment.create(file: image)
      @photo.image_id = attachment.id
      @photo.description = photo_params[:description]
      @photo.save
    end
    redirect_to admin_photo_shows_path
  end

  def destroy
    @photo = PhotoShow.find params[:id]
    Attachment.delete @photo.image_id
    @photo.destroy
    redirect_to admin_photo_shows_path
  end

  private
    def photo_params
      params.require(:photo_show).permit(:description, images: [])
    end
end