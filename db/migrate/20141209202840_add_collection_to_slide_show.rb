class AddCollectionToSlideShow < ActiveRecord::Migration
  def change
    add_reference :slide_shows, :collection, index: true
  end
end
