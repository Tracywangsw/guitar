class Admin::ScoresController < Admin::ApplicationController
  def index
    @scores = Score.all
  end

  def create
    score = Score.new
    score.name = score_params[:name]
    score.description = score_params[:description]
    score_params[:images].each do |image|
      attachment = Attachment.create(file: image)
      score.image_ids.push attachment.id
    end
    score.save
    redirect_to admin_scores_path
  end

  def show
    @score = Score.find(params[:id])
  end

  def update
    @score = Score.find params[:id]
    @score.name = score_params[:name]
    @score.description = score_params[:description]
    if score_params[:images]
      Attachment.delete @score.image_ids
      @score.image_ids = []
      score_params[:images].each do |image|
        attachment = Attachment.create(file: image)
        @score.image_ids.push attachment.id
      end
    end
    @score.save
    redirect_to admin_scores_path
  end

  def update_images_order
    @score = Score.find params[:id]
    if @score.is_images_valid(params[:ids])
      @score.update_attribute :image_ids, params[:ids]
      @score.save
      head :ok
    else
      head :bad_request
    end
  end

  def destroy
    score = Score.find params[:id]
    Attachment.delete score.image_ids
    score.destroy
    redirect_to admin_scores_path
  end

  def edit
    @score = Score.find params[:id]
  end

  def new
    @score = Score.new
  end

  private
  def score_params
    params.require(:score).permit(:name, :description, images: [])
  end
end
