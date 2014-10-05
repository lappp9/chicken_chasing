class Product < ActiveRecord::Base
  belongs_to :farm
  belongs_to :order

  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

  def farmer
    self.farm.farmer
  end

end
