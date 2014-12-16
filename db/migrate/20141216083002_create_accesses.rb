class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.references :grouph, index: true
      t.string :role

      t.timestamps
    end
  end
end
