class AddTopToSlideShow < ActiveRecord::Migration
  def change
    add_reference :slide_shows, :top, index: true
  end
end
