class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
