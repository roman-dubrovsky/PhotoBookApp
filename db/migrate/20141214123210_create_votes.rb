class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.integer :content_id
      t.string :content_type

      t.timestamps
    end
  end
end
