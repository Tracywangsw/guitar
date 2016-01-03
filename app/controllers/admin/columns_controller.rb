class Admin::ColumnsController < Admin::ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.find params[:id]
  end

  def new
    @column = Column.new
  end

  def edit
    @column = Column.find params[:id]
  end

  def create
    @column = Column.new
    if column_params[:is_recommend] == "yes"
      @column.is_recommend = true
    else
      @column.is_recommend = false
    end
    @column.name = column_params[:name]
    @column.description = column_params[:description]
    @column.video_url = column_params[:video_url]

    if column_params[:cover_image]
      attachment = Attachment.create file: column_params[:cover_image]
      @column.update cover_image_id: attachment.id
    end

    if column_params[:images]
      column_params[:images].each do |image|
        attachment = Attachment.create(file: image)
        @column.image_ids.push attachment.id
      end
    end

    if @column.save
      redirect_to admin_columns_path
    else
      render "new"
    end
  end

  def update
    @column = Column.find params[:id]
    @column.assign_attributes column_params.slice(:is_recommend, :name, :video_url, :description)
    
    if column_params[:is_recommend] == "yes"
      @column.is_recommend = true
    else
      @column.is_recommend = false
    end

    if column_params[:cover_image]
      attachment = Attachment.create file: column_params[:cover_image]
      @column.update cover_image_id: attachment.id
    end

    if column_params[:images]
      Attachment.delete @column.image_ids
      @column.image_ids = []
      column_params[:images].each do |image|
        attachment = Attachment.create(file: image)
        @column.image_ids.push attachment.id
      end
    end

    if @column.save
      redirect_to admin_columns_path
    else
      render "edit"
    end
  end

  def destroy
    @column = Column.find params[:id]
    Attachment.delete @column.image_ids
    @column.destroy
    head :ok
  end

  def update_images_order
    @column = Column.find params[:id]
    if @column.is_images_exist(params[:ids])
      @column.update_attribute :image_ids, params[:ids]
      @column.save
      head :ok
    else
      head :bad_request
    end
    
  end

  private
    def column_params
      params.require(:column).permit(:is_recommend, :name, :video_url, :description, :cover_image, images: [])
    end

end
