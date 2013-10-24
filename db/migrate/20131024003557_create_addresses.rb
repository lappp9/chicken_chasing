class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.integer :user_id
      t.integer :farm_id

      t.timestamps
    end
  end
end
