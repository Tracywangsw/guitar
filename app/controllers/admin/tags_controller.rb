class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new
    @tag.name = tag_params[:name]
    if tag_params[:cover_image]
      attachment = Attachment.create(file: tag_params[:cover_image])
      @tag.cover_image_id = attachment.id
    end
    @tag.save
    redirect_to admin_tags_path
  end

  def update
    @tag = Tag.find params[:id]
    @tag.name = tag_params[:name]
    if tag_params[:cover_image]
      Attachment.delete @tag.cover_image_id
      attachment = Attachment.create(file: tag_params[:cover_image])
      @tag.cover_image_id = attachment.id
    end
    @tag.save
    redirect_to admin_tags_path
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def destroy
    @tag = Tag.find params[:id]
    Attachment.delete @tag.cover_image_id
    @tag.destroy
    redirect_to admin_tags_path
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :cover_image)
    end
end