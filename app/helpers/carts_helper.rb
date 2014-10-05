module CartsHelper 

  def cart_total_for(product_hash)
    total = 0
    product_hash.each  { |k,v| total += k.price * v }
    total
  end

end