class CreateGrouphUsers < ActiveRecord::Migration
  def change
    create_table :grouph_users do |t|
      t.references :user, index: true
      t.references :grouph, index: true

      t.timestamps
    end
  end
end
