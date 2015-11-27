class User < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAILL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAILL_REGEX}, uniqueness: { case_sensitive: false }

  before_save { email.downcase! }

  has_secure_password

  validates :password, length: { minimum: 6 }
end
