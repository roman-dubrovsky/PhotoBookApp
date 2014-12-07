class ProfileController < ApplicationController
  def show
    @user = User.find params[:id]
    @albums = @user.albums
    @comments = @user.comments
    @comment = @user.comments.new
  end
end
