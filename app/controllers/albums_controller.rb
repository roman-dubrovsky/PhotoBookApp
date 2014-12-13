class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy, :add, :delete]

  def show
    @comments = @album.comments
  end

  def new
    @album = Album.new
    @collection = params[:collection]
  end

  def edit
    @photos = Photo.where('id not IN (?)', @album.photos.select(:id))
  end

  def create
    @collection = Collection.find(params[:album][:collection])
    @album = current_user.albums.new(album_params)
    @album.collection = @collection
    @album.save
    redirect_to album_path(@album)
  end

  def update
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def add
    AlbumPhotoSetting.create(album: @album, photo_id: params[:photo])
    redirect_to edit_album_path(@album)
  end

  def delete
    temp = AlbumPhotoSetting.find_by(album: @album, photo_id: params[:photo])
    temp.destroy
    redirect_to edit_album_path(@album)
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :description)
    end
end
