class User < ActiveRecord::Base
  belongs_to :profile, polymorphic: true
  has_one :cart
  has_many :payment_methods

  before_create :create_remember_token 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email,    presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :name,     presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }

  has_secure_password

  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def farmer
    Farmer.find_by id: self.profile_id
  end

  def is_farmer?
    self.profile_type == "Farmer"
  end
  
  def farm_id
    self.farmer.farm.id
  end

    private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
