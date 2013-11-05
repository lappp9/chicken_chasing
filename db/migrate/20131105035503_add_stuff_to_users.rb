class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_type, :string
    add_column :users, :profile_id, :integer
  end
end
