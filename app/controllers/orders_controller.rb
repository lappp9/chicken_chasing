class OrdersController < ApplicationController


  def create
    product_quantities = []
    params[:products].each do |product|
      product_quantity = ProductQuantity.build(p)
      product_quantity.save
      product_quantities << product_quantity
    end
    @order = Order.build(user: current_user, product_quantities: product_quantities)
  end

private
  
  def order_params
    params.permit_all_parameters = true
  end
  
end
