class PhotosController < ApplicationController
  def index
    @photos = current_user.photos
    @photo = Photo.new
  end

  def show
    @photo = Photo.find params[:id]
    items = current_user.photos.map{|p| p.id}
    @num = items.index(params[:id].to_i)
    @next = Photo.find(items[@num + 1] || items[0])
    @pred = Photo.find(items[@num - 1])
    @count = items.count
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.save
    redirect_to photos_path
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private
    def photo_params
      params.require(:photo).permit(:file)
    end
end
