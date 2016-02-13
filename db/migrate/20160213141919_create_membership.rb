class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      
      t.integer :user_id, null: false
      t.integer :band_id, null: false
      t.string :band_name, null: false

      t.timestamps null: false
    end
  end
end
