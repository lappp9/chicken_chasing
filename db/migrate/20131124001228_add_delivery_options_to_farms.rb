class AddDeliveryOptionsToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :delivery_options, :text
  end
end
