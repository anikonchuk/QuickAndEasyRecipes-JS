class User < ApplicationRecord
  has_many :recipes
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

end
