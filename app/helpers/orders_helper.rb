module OrdersHelper

  def order_descriptors_for(order)

    order.product_quantities.map(&:product_name).join(', ')
  end

end