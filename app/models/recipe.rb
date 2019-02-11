class Recipe < ApplicationRecord
  belongs_to :user
  has_many :quantities
  has_many :ingredients, through: :quantities

  validates :name, :instructions, :time, presence: true

  accepts_nested_attributes_for :quantities

  def quantities_attributes=(quantities_attributes)
    self.quantities.destroy_all
    quantities_attributes.each do |key, value|
      if value["ingredient_attributes"]["name"] != ""
        ingredient = Ingredient.find_or_create_by(name: value["ingredient_attributes"]["name"])
        self.quantities.build(ingredient: ingredient, amount: value["amount"])
      end
    end
  end
end
