class BeerSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :description, :abv, :isOrganic, :status, :available, :category, :style, :icon_url
end
