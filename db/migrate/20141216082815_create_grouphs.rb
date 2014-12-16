class CreateGrouphs < ActiveRecord::Migration
  def change
    create_table :grouphs do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
