class CreateProductQuantities < ActiveRecord::Migration
  def change
    create_table :product_quantities do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.string :unit
      t.decimal :price

      t.timestamps
    end
  end
end
