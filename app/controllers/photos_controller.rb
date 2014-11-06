class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = current_user.photos
    @photo = Photo.new
  end

  def show
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.save
    redirect_to photos_path
  end
  
  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:file)
    end
end
