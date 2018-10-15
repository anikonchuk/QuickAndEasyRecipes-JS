class User < ApplicationRecord
  has_many :recipes
  has_secure_password
end
