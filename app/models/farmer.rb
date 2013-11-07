class Farmer < ActiveRecord::Base
  has_one :farm
  has_one :user, as: :profile, dependent: :destroy
end
