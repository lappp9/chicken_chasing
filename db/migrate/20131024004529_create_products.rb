class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.string :name
      t.integer :category
      t.integer :farm_id

      t.timestamps
    end
  end
end
