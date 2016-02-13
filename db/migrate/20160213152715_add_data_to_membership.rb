class AddDataToMembership < ActiveRecord::Migration
  def change
  	add_column :memberships, :band_name, :string
  	add_column :memberships, :band_id, :integer
  	add_column :memberships, :user_id, :integer
  end
end
