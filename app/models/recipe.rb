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
