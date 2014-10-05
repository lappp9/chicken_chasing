class OrdersController < ApplicationController
  include OrdersHelper

  respond_to :json, :html

  def create
    order_params = { customer_id: current_user.id, date: Date.new }
    @order = Order.new(order_params)
    if @order.save
      params[:products].each do |product|
        product_quantity = @order.product_quantities.build(product_id: product[:id], price: product[:price], quantity: product[:quantity])
        if product_quantity.invalid?
          @order.errors << 'error with product quantity'
        end
        if @order.errors.any?
          render json: { errors: @order.errors }
        end
      end
      clear_cart
      render json: @order, status: 200

    else
      render json: { errors: @order.errors }
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

private
  
  def order_params
    params.permit_all_parameters = true
  end
  
end
