class HomeController < ApplicationController
  def index
    @collection = Album.all
  end
end
