class CreateCartsHaveProducts < ActiveRecord::Migration
  def change
    create_table :carts_have_products do |t|
      t.integer :cart_id
      t.integer :product_id

      t.timestamps
    end
  end
end
