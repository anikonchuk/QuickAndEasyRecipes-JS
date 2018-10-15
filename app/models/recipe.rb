class Recipe < ApplicationRecord
  belongs_to :user
  has_many :quantities
  has_many :ingredients, through: :quantities

  validates :name, presence: true

  scope :recently_added, -> { order(created_at: :desc) }
  scope :by_name, -> { order(name: :asc) }
end
