class AddFarmIdAndOrderStatusIdToProductQuantities < ActiveRecord::Migration
  def change
    add_column :product_quantities, :farm_id, :integer
    add_column :product_quantities, :order_status_id, :integer
  end
end
