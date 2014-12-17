class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  layout false, only: [:index]

  def index
    @users = User.all
  end
end
