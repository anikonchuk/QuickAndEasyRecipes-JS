class Quantity < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :amount, presence: true

  accepts_nested_attributes_for :ingredient
end
