class User < ApplicationRecord
  has_one :cart
  has_one :wishlist
  has_many :reviews
  validates :email, presence: true, uniqueness: true
  has_secure_password validations:false
end
