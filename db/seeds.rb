# -*- encoding : utf-8 -*-
genres = File.read("#{Rails.root}/db/beer_genres.json")
flavors = File.read("#{Rails.root}/db/food_flavors.json")
Seed.genres(genres)
Seed.flavors(flavors)
Seed.beers
Seed.matches