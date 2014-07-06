class Seed
  def self.genres 
    beer_genres = ["Cream Ale / Blonde Ale", "Bitter", "Pale Ale", "IPA",
     "Double IPA", "Amber Ale / Red Ale", "Scotch Ale", 
     "Brown Ale / Altbier", "Imperial Stout", "Oatmeal Stout", 
     "Old Ale / Strong Ale", "Porter", "Abbey Dubbel", "Abbey Tripel",
      "Hefewiezen", "Witbier", "American Wheat", "Barley Wine"]
    beer_genres.each do |genre|
      BeerGenre.create(name: genre)
    end
  end

  def self.beers_fake
    names = [".38 Special", "100 Barrel Series #31", "13 Rebels",
     "1327 Pod", "Red Mullet Ale", "Stone Jail 13",
      "Ziegenbock Amber", "Yosemite Scooter", "Wupper Hell",
      "Wusele Weizen", "Belmont Station 15th Anniversary Ale",
      "Below Decks", "Cello Stout", "Celt's Golden Ale", 
      "Celtic Ale", "Eighty Shilling Export Ale", "Eighty-Four",
      "Eighty-Shilling Scottish Ale (80/-)", "Einbecker Alster",
      "Einbecker Brauherren Alkoholfrei"]
    categories = ["Bitter", "Pilsner", "Porter",
     "Cream Ale / Blonde Ale"]
    styles = ["Ordinary Bitter", "German-Style Pilsener",
     "Brown Porter", "Golden or Blonde Ale"]
    abv = [3.8, 5.8, 5.2, 5.6]
    available = ["Year Round", "Seasonal"]
    icon_url = "https://s3.amazonaws.com/brewerydbapi/beer/FOQMff/upload_3aTloe-icon.png"
    description = "It's good!"
    names.each_with_index do |name, index|
      Beer.create(name: name, abv: abv[index % 4], available: available[index % 2], category: categories[index % 4], style: styles[index % 4], icon_url: icon_url, description: description)
    end
  end

  def self.flavors
    flavors = ["strong","bitter","fried/fatty","spicy","salty",
      "floral","light","citrus/acidic","sweet","spiced","creamy",
      "rich","earthy","nutty","gamey","savory","grilled","smokey",
      "heavy","hearty"]
    flavors.each do |f|
      FoodFlavor.create(name: f)
    end
  end


  def self.matches
    cream_blonde = BeerGenre.find(1)
    bitter_beer = BeerGenre.find(2)
    pale_ale = BeerGenre.find(3)
    ipa = BeerGenre.find(4)
    double_ipa = BeerGenre.find(5)
    amber_red = BeerGenre.find(6)
    scotch_ale = BeerGenre.find(7)
    brown_altbier = BeerGenre.find(8)
    imperial_stout = BeerGenre.find(9)
    oatmeal_stout = BeerGenre.find(10)
    old_strong = BeerGenre.find(11)
    porter = BeerGenre.find(12)
    dubbel = BeerGenre.find(13)
    tripel = BeerGenre.find(14)
    hefe = BeerGenre.find(15)
    witbier  = BeerGenre.find(16)
    american_wheat = BeerGenre.find(17)
    barley_wine = BeerGenre.find(18)

    strong = FoodFlavor.find(1)
    bitter = FoodFlavor.find(2)
    fried_fatty = FoodFlavor.find(3)
    spicy = FoodFlavor.find(4)
    salty = FoodFlavor.find(5)
    floral = FoodFlavor.find(6)
    light = FoodFlavor.find(7)
    citrus_acidic = FoodFlavor.find(8)
    sweet = FoodFlavor.find(9)
    spiced = FoodFlavor.find(10)
    creamy = FoodFlavor.find(11)
    rich = FoodFlavor.find(12)
    earthy = FoodFlavor.find(13)
    nutty = FoodFlavor.find(14)
    gamey = FoodFlavor.find(15)
    savory = FoodFlavor.find(16)
    grilled = FoodFlavor.find(17)
    smokey = FoodFlavor.find(18)
    heavy = FoodFlavor.find(19)
    hearty = FoodFlavor.find(20)

    matches = []

    matches << Match.new(beer_genre: cream_blonde, food_flavor: light, intensity: 5)
    matches << Match.new(beer_genre: cream_blonde, food_flavor: citrus_acidic, intensity: 4)
    matches << Match.new(beer_genre: cream_blonde, food_flavor: sweet, intensity: 5)
    matches << Match.new(beer_genre: cream_blonde, food_flavor: spicy, intensity: 4)
    matches << Match.new(beer_genre: bitter_beer, food_flavor: sweet, intensity: 3)
    matches << Match.new(beer_genre: bitter_beer, food_flavor: spicy, intensity: 3)
    matches << Match.new(beer_genre: bitter_beer, food_flavor: fried_fatty, intensity: 3)
    matches << Match.new(beer_genre: bitter_beer, food_flavor: smokey, intensity: 4)
    matches << Match.new(beer_genre: pale_ale, food_flavor: fried_fatty, intensity: 5)
    matches << Match.new(beer_genre: pale_ale, food_flavor: earthy, intensity: 3)
    matches << Match.new(beer_genre: ipa, food_flavor: spiced, intensity: 3)
    matches << Match.new(beer_genre: ipa, food_flavor: creamy, intensity: 5)
    matches << Match.new(beer_genre: ipa, food_flavor: spicy, intensity: 5)
    matches << Match.new(beer_genre: double_ipa, food_flavor: grilled, intensity: 5)
    matches << Match.new(beer_genre: double_ipa, food_flavor: smokey, intensity: 4)
    matches << Match.new(beer_genre: double_ipa, food_flavor: sweet, intensity: 3)
    matches << Match.new(beer_genre: amber_red, food_flavor: nutty, intensity: 5)
    matches << Match.new(beer_genre: amber_red, food_flavor: sweet, intensity: 4)
    matches << Match.new(beer_genre: amber_red, food_flavor: salty, intensity: 4)
    matches << Match.new(beer_genre: amber_red, food_flavor: spicy, intensity: 3)
    matches << Match.new(beer_genre: scotch_ale, food_flavor: rich, intensity: 4)
    matches << Match.new(beer_genre: scotch_ale, food_flavor: gamey, intensity: 4)
    matches << Match.new(beer_genre: scotch_ale, food_flavor: smokey, intensity: 3)
    matches << Match.new(beer_genre: brown_altbier, food_flavor: savory, intensity: 4)
    matches << Match.new(beer_genre: brown_altbier, food_flavor: nutty, intensity: 4)
    matches << Match.new(beer_genre: brown_altbier, food_flavor: heavy, intensity: 4)
    matches << Match.new(beer_genre: imperial_stout, food_flavor: creamy, intensity: 3)
    matches << Match.new(beer_genre: imperial_stout, food_flavor: savory, intensity: 4)
    matches << Match.new(beer_genre: imperial_stout, food_flavor: bitter, intensity: 3)
    matches << Match.new(beer_genre: oatmeal_stout, food_flavor: sweet, intensity: 4)
    matches << Match.new(beer_genre: oatmeal_stout, food_flavor: bitter, intensity: 5)
    matches << Match.new(beer_genre: oatmeal_stout, food_flavor: gamey, intensity: 3)
    matches << Match.new(beer_genre: oatmeal_stout, food_flavor: hearty, intensity: 4)
    matches << Match.new(beer_genre: old_strong, food_flavor: gamey, intensity: 5)
    matches << Match.new(beer_genre: old_strong, food_flavor: strong, intensity: 5)
    matches << Match.new(beer_genre: porter, food_flavor: hearty, intensity: 5)
    matches << Match.new(beer_genre: porter, food_flavor: smokey, intensity: 5)
    matches << Match.new(beer_genre: porter, food_flavor: bitter, intensity: 5)
    matches << Match.new(beer_genre: dubbel, food_flavor: salty, intensity: 3)
    matches << Match.new(beer_genre: dubbel, food_flavor: savory, intensity: 5)
    matches << Match.new(beer_genre: tripel, food_flavor: floral, intensity: 3)
    matches << Match.new(beer_genre: tripel, food_flavor: sweet, intensity: 2)
    matches << Match.new(beer_genre: tripel, food_flavor: nutty, intensity: 4)
    matches << Match.new(beer_genre: tripel, food_flavor: bitter, intensity: 5)
    matches << Match.new(beer_genre: hefe, food_flavor: spicy, intensity: 3)
    matches << Match.new(beer_genre: hefe, food_flavor: light, intensity: 4)
    matches << Match.new(beer_genre: hefe, food_flavor: citrus_acidic, intensity: 3)
    matches << Match.new(beer_genre: witbier, food_flavor: sweet, intensity: 2)
    matches << Match.new(beer_genre: witbier, food_flavor: floral, intensity: 5)
    matches << Match.new(beer_genre: witbier, food_flavor: citrus_acidic, intensity: 3)
    matches << Match.new(beer_genre: american_wheat, food_flavor: light, intensity: 5)
    matches << Match.new(beer_genre: american_wheat, food_flavor: citrus_acidic, intensity: 5)
    matches << Match.new(beer_genre: barley_wine, food_flavor: salty, intensity: 3)
    matches << Match.new(beer_genre: barley_wine, food_flavor: creamy, intensity: 5)
    matches << Match.new(beer_genre: barley_wine, food_flavor: rich, intensity: 5)

    matches.each do |match|
      match.save
    end
  end

end

Seed.genres
Seed.flavors
Seed.beers_fake
Seed.matches
