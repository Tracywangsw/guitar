class Admin::AdvertisementsController < Admin::ApplicationController
  def index
    @ads = Advertisement.all
  end

  def create
    @ad = Advertisement.new ad_params.slice(:name, :purchase_url, :status)
    if @ad.save
      if ad_params[:cover_image]
        attachment = Attachment.create! file: ad_params[:cover_image]
        @ad.update cover_image_id: attachment.id
      end
      redirect_to admin_advertisements_path
    else
      render "new"
    end
  end

  def update
    @ad = Advertisement.find(params[:id])
    @ad.assign_attributes ad_params.slice(:name, :purchase_url, :status)
    if @ad.save
      if ad_params[:cover_image]
        attachment = Attachment.create! file: ad_params[:cover_image]
        @ad.update cover_image_id: attachment.id
      end
      redirect_to admin_advertisements_path
    else
      render "new"
    end
  end

  def destroy
    @ad = Advertisement.find(params[:id])
    @ad.destroy
    redirect_to admin_advertisements_path
  end

  def new
    @ad = Advertisement.new
  end

  def edit
    @ad = Advertisement.find(params[:id])
  end

  def ad_params
    params.require(:advertisement).permit(:name, :purchase_url, :status, :cover_image)
  end
end