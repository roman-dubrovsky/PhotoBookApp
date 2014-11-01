class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = current_user.albums.new(album_params)
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

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :description)
    end
end
