class AddCollectionToAlbum < ActiveRecord::Migration
  def change
    add_reference :albums, :collection, index: true
  end
end
