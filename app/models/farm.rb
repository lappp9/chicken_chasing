class Farm < ActiveRecord::Base
  has_many :products, dependent: :destroy
  belongs_to :farmer

  has_attached_file :image, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

end
