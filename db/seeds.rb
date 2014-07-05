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
end

Seed.genres
Seed.flavors
Seed.beers_fake 
