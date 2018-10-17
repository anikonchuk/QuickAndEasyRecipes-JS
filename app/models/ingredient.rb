class Ingredient < ApplicationRecord
  has_many :quantities
  has_many :recipes, through: :quantities

  scope :by_name, -> { order(name: :asc) }

end
