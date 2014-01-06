class Farm < ActiveRecord::Base
  has_many :products, dependent: :destroy
  belongs_to :farmer
end
