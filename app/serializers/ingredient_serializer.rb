class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :quantities
  has_many :recipes
end
