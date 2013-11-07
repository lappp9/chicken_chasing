class RemoveTypeFromFarmers < ActiveRecord::Migration
  def change
    remove_column :farmers, :type, :string
  end
end
