class Admin::PhotosController < Admin::BaseController

  before_filter :authenticate_admin

  before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "Photo successfully saved"
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @photo.update_attributes(photo_params)
      flash[:success] = 'Successfully updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to action: :index
  end

  private

  def set_photo
    @photo = Photo.find params[:id]
  end

  def photo_params
    params.require(:photo).permit(:one_liner,
                                          :description,
                                          :image).merge(user_id: current_user.id)
  end

end