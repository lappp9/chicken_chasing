class Farmer < ActiveRecord::Base
  has_one :farm
  has_one :user, as: :profile, dependent: :destroy

  validates :favorite_quotes, presence: true
end
