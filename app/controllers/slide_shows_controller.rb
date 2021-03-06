class SlideShowsController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy, :add, :delete]
  skip_before_action :authenticate_user!, only: :show

  def show
    @comments = @slide_show.comments
  end

  def new
    @slide_show = SlideShow.new
    @collection = params[:collection]
  end

  def edit
    @photos = Photo.where('id not IN (?)', @slide_show.photos.select(:id))
  end

  def create
    @collection = Collection.find(params[:slide_show][:collection])
    @slide_show = current_user.slide_shows.new(slide_show_params)
    @slide_show.collection = @collection
    @slide_show.save
    redirect_to edit_slide_show_path(@slide_show)
  end

  def update
    @slide_show.update(slide_show_params)
    redirect_to slide_show_path(@slide_show)
  end

  def destroy
    @slide_show.destroy
    redirect_to index_path
  end

  def add
    PhotoSlideShow.create(slide_show: @slide_show, photo_id: params[:photo])
    redirect_to edit_slide_show_path(@slide_show)
  end

  def delete
    temp = PhotoSlideShow.find_by(slide_show: @slide_show, photo_id: params[:photo])
    temp.destroy
    redirect_to edit_slide_show_path(@slide_show)
  end

  private
    def set_slide
      @slide_show = SlideShow.find(params[:id])
    end

    def slide_show_params
      params.require(:slide_show).permit(:title, :description)
    end
end
