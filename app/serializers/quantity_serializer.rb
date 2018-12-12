class QuantitySerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :recipe
  belongs_to :ingredient
end
