class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :farmer_id
      t.integer :customer_id
      t.datetime :date
      t.decimal :total

      t.timestamps
    end
  end
end
