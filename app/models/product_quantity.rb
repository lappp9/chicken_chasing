class ProductQuantity < ActiveRecord::Base

  belongs_to :product
  belongs_to :order
  belongs_to :farm
  belongs_to :customer
  belongs_to :order_status

  validates_presence_of :product
  validates_presence_of :order
  validates_presence_of :farm

  def total_sale
    self.quantity * self.price
  end

  def product_name
    product.name
  end

  def customer
    self.order.customer
  end

end
