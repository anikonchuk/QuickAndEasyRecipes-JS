class User < ApplicationRecord
  has_many :recipes
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash["info"]["email"]
    self.where(email: oauth_email).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end
