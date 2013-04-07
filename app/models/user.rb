class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :wishlists
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_secure_password

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w\-.\+]+@[a-z\d\-.]+\.+[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }   
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true

  def favorite!(vendor_id)
    self.favorites.create(vendor_id: vendor_id)
  end
  
  def favorite?(vendor_id)
    self.favorites.find_by_vendor_id(vendor_id)
  end

  def unfavorite!(vendor_id)
    self.favorites.find_by_vendor_id(vendor_id).destroy
  end

  private 
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64  
  end
end
