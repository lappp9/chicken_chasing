class Farmer < ActiveRecord::Base
  has_one :farm

  has_one :user, as: :profile, dependent: :destroy
  accepts_nested_attributes_for :user

  validates :favorite_quotes, presence: true

  def farm_name
    self.farm.name
  end

  def user_name
    self.user.name
  end
end
