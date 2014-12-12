class ProfileController < ApplicationController

  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find params[:id]
    info_about_user
  end

  def index
    @user = current_user
    info_about_user
  end

private 
  def info_about_user
    @collections = @user.collections
    @comments = @user.comments
  end
end
