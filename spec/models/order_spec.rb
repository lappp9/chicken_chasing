require 'spec_helper'

describe Order do

  context 'creating with product quantities' do

    before(:each) do
      user = User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password', name: 'bill')
      farmer = Farmer.create(role_models: 'abe', favorite_quotes: 'keep it simple stupid')
      corn = Product.create(name: 'Corn', price: 5.00)
      chx = Product.create(name: 'Chicken', price: 6.00)
      peppers = Product.create(name: 'Bell Peppers', price: 7.00)
      asparagus = Product.create(name: 'Asparagus', price: 8.00)
      product_quantity_params = [
        { quantity: 5, price: 5, product_id: corn.id, farm_id: 1 },
        { quantity: 3, price: 6, product_id: chx.id, farm_id: 1},
        { quantity: 2, price: 7, product_id: peppers.id, farm_id: 1 },
        { quantity: 1, price: 8, product_id: asparagus.id, farm_id: 1 }
      ]
      @order_params = { customer_id: user.id, product_quantities_attributes: product_quantity_params, farmer_id: farmer.id, date: Date.new }
    end

    pending it 'creates an order' do
      order = Order.new(@order_params)
      debugger
      expect { order.save }.to change{ Order.count }.by 1
    end

  end
end
