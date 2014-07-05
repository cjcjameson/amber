# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
beer_genres = ["Cream Ale / Blonde Ale", "Bitter", "Pale Ale", "IPA", "Double IPA", "Amber Ale / Red Ale", "Scotch Ale", "Brown Ale / Altbier", "Imperial Stout", "Oatmeal Stout", "Old Ale / Strong Ale", "Porter", "Abbey Dubbel", "Abbey Tripel", "Hefewiezen", "Witbier", "American Wheat", "Barley Wine"]

beer_genres.each do |genre|
  BeerGenre.create(name: genre)
end

for i in 1..5
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
    	new_beer.update_attributes(category: result["style"]["category"]["name"],style: result["style"]["name"])
    end
    if result["labels"]
      new_beer.update_attributes(icon_url: result["labels"]["icon"])
    end
  end
end

#==========================
#==========YUZU============
#this is for testing the form, to be fixed later
FoodFlavor.create(name:"sour")
FoodFlavor.create(name:"sweet")
FoodFlavor.create(name:"spicy")
#==========================
