class FoodFlavorSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name
end
