class AddTypeToFarmers < ActiveRecord::Migration
  def change
    add_column :farmers, :type, :string
  end
end
