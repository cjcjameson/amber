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

  def self.beers(num)
    for i in 1..num
      puts i
      result = HTTParty.get("http://api.brewerydb.com/v2/beers/?key=ecca795782bac08b48d8d9aac51602c8&p#{i}&status=verified&format=json")
      parsed_results = JSON.parse(result.to_json)["data"]
      parsed_results.each do |result|
        new_beer = Beer.create(name: result["name"],
         description: result["description"],
         abv: result["abv"], 
         isOrganic: result["isOrganic"],
         status: result["status"])
        
        if result["available"]
        	new_beer.update_attributes(available: result["available"]["name"])
        end
        if result["style"]
        	new_beer.update_attributes(category: result["style"]["category"]["name"],
            style: result["style"]["name"])
        end
        if result["labels"]
          new_beer.update_attributes(icon_url: result["labels"]["icon"])
        end
      end
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
Seed.beers(5) #change the input to 581 when actually seeding
Seed.flavors
