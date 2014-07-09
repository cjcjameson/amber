# -*- encoding : utf-8 -*-
genres = File.read("#{Rails.root}/db/beer_genres.json")
Seed.genres(genres)
Seed.flavors
Seed.beers
Seed.matches