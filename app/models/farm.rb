class Farm < ActiveRecord::Base
  has_many :products, dependent: :destroy
  belongs_to :farmer

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
