class CreatePhotoSlideShows < ActiveRecord::Migration
  def change
    create_table :photo_slide_shows do |t|
      t.references :photo, index: true
      t.references :slide_show, index: true

      t.timestamps
    end
  end
end
