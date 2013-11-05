class Farmer < User
  has_one :farm
  has_one :user, as: :profile, dependent: :destroy
end
