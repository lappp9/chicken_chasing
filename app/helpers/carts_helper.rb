module CartsHelper 

  def cart_total_for(products)
    total = 0
    debugger
    products.each do |product|
      total += product.price
    end
  end

end