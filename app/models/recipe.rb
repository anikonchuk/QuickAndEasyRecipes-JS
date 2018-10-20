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

#if quantities_attribute[1]["name"] != ""
#  ingredient = Ingredient.find_or_create_by(name: ingredients_attribute[1]["name"])
#  self.quantities.build(ingredient: ingredient, amount: ingredients_attribute[1]["quantities"]["amount"])
#end
#=> {"0"=>{"amount"=>"2 slices", "ingredient_attributes"=>{"name"=>"Bread"}},
# "1"=>{"amount"=>"2 slices", "ingredient_attributes"=>{"name"=>"Ham"}},
## "2"=>{"amount"=>"1 slice", "ingredient_attributes"=>{"name"=>"Cheddar Cheese"}},
# "3"=>{"amount"=>"1 tbsp", "ingredient_attributes"=>{"name"=>"Mayonnaise"}},
# "4"=>{"amount"=>"", "ingredient_attributes"=>{"name"=>""}},
# "5"=>{"amount"=>"", "ingredient_attributes"=>{"name"=>""}},
# "6"=>{"amount"=>"", "ingredient_attributes"=>{"name"=>""}},
# "7"=>{"amount"=>"", "ingredient_attributes"=>{"name"=>""}},
# "8"=>{"amount"=>"", "ingredient_attributes"=>{"name"=>""}},
# "9"=>{"amount"=>"", "ingredient_attributes"=>{"name"=>""}}}
