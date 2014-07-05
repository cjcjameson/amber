class BeerSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :description, :abv, :available, :category, :style, :icon_url
end
