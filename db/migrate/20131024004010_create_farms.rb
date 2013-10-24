class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.integer :farmer_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
