module CartsHelper 

  def cart_total_for(product_hash)
    total = 0
    product_hash.keys.each do |p|
      total += p.price
    end
    total
  end

end