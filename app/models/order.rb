class Order < ActiveRecord::Base
  has_many :product_quantities
  has_many :products, through: :product_quantities
  belongs_to :customer, class_name: 'User' 
  belongs_to :farmer

  accepts_nested_attributes_for :product_quantities

  validates_presence_of :customer
  validates_presence_of :farmer
  validates_presence_of :product_quantities

  def total
    total = 0
    self.product_quantities.each { |pq| total += pq.quantity * pq.price } 
    total
  end

end
