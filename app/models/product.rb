class Product < ActiveRecord::Base
  belongs_to :farm

  def farmer
    self.farm.farmer
  end

end
