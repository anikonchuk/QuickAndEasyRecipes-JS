class Recipe < ApplicationRecord
  belongs_to :user
  has_many :quantities
  has_many :ingredients, through: :quantities

  validates :name, :instructions, :time, presence: true

  scope :by_recently_added, -> { order(created_at: :desc) }
  scope :by_name, -> { order(name: :asc) }
  scope :by_shortest_time, -> { order(time: :asc) }

  accepts_nested_attributes_for :quantities

  def ingredient_count
    self.ingredients.count
  end

  def ingredients_attributes=(ingredients_attributes)
    self.quantities.destroy_all
    ingredients_attributes.each do |ingredients_attribute|
      if ingredients_attribute[1]["name"] != ""
        ingredient = Ingredient.find_or_create_by(name: ingredients_attribute[1]["name"])
        self.quantities.build(ingredient: ingredient, amount: ingredients_attribute[1]["quantities"]["amount"])
      end
    end
  end
end
