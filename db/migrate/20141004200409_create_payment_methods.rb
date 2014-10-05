class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.integer :user_id
      t.string :nickname
      t.string :token

      t.timestamps
    end
  end
end
