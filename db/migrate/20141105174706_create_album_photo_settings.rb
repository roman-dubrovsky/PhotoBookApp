class CreateAlbumPhotoSettings < ActiveRecord::Migration
  def change
    create_table :album_photo_settings do |t|
      t.references :album, index: true
      t.references :photo, index: true

      t.timestamps
    end
  end
end
