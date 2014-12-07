class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.text :body
      t.integer :commentable_id, index: true
      t.string :commentable_type

      t.timestamps
    end
  end
end
