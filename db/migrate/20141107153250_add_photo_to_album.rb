class AddPhotoToAlbum < ActiveRecord::Migration
  def change
    add_reference :albums, :top, index: true
  end
end
