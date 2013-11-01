class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.integer :user_id
      t.text :favorite_quotes
      t.text :role_models
      t.text :personal_philosophy

      t.timestamps
    end
  end
end
