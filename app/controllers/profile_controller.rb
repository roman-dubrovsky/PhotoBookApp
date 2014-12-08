class ProfileController < ApplicationController
  def show
    @user = User.find params[:id]
    @albums = @user.albums
    @slide_shows = @user.slide_shows
    @comments = @user.comments
    @comment = @user.comments.new
  end
end
