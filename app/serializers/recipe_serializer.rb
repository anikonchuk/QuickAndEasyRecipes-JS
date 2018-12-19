class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :time
  has_many :quantities
  has_many :ingredients
end
