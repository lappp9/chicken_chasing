class RemoveUserIdFromFarmers < ActiveRecord::Migration
  def change
    remove_column :farmers, :user_id, :string
  end
end
