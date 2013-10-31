class Farm < ActiveRecord::Base
  has_many :products
#  belongs_to :farmer
end
