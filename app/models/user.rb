class User < ApplicationRecord
  has_many :recipes
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  scope :by_name, -> { order(username: :asc) }
end
