class Seed
  def self.genres(genres)
    beer_genres = JSON.parse(genres)
    beer_genres.each do |genre|
      BeerGenre.create(genre)
    end
  end

  def self.flavors(flavors)
    food_flavors = JSON.parse(flavors)
    food_flavors.each do |flavor|
      FoodFlavor.create(flavor)
    end
  end

  def self.matches(matches)
    all_matches = JSON.parse(matches)
    all_matches.each do |match|
      Match.create(beer_genre: BeerGenre.find_by_name(match["beer_genre"]),
                  food_flavor: FoodFlavor.find_by_name(match["food_flavor"]),
                  intensity: match["intensity"])
    end
  end

  def self.beers
    for i in 1..583
      results = get_beer_data(i)
      beer_info_array = parse_beer_data(results)
      create_beer_objects(beer_info_array)
    end
  end
  
  def self.get_beer_data(page_number)
    HTTParty.get("http://api.brewerydb.com/v2/beers/?key=#{CONFIG['brewerydb']['key']}&p=#{page_number}&status=verified&format=json").to_json
  end

  def self.parse_beer_data(data)
    JSON.parse(data)["data"]
  end

  def self.create_beer_objects(beers)
    beers.each do |beer|
      beer["status"] == "verified" ? new_beer = Beer.new : next

      new_beer.name = beer["name"]
      new_beer.description = beer["description"]
      new_beer.abv = beer["abv"]
      new_beer.available = beer["available"]["name"] if beer["available"]
      new_beer.label_url = beer["labels"]["medium"] if beer["labels"]

      new_beer.style = beer["style"]["name"] if beer["style"]

      new_beer = set_beer_category(new_beer, beer["style"]["category"]["name"]) if new_beer.style
      new_beer.save
    end
  end

  def self.set_beer_category(beer, default_style)
    case beer.style
    when "American-Style Cream Ale or Lager", "Golden or Blonde Ale", "Belgian-Style Blonde Ale"
      beer.category = "Cream Ale / Blonde Ale"
    when "Ordinary Bitter", "Special Bitter or Best Bitter", "Extra Special Bitter"
      beer.category = "Bitter"
    when "Classic English-Style Pale Ale", "American-Style Pale Ale", "American-Style Strong Pale Ale", "Belgian-Style Pale Ale", "International-Style Pale Ale", "Australasian-Style Pale Ale"
      beer.category = "Pale Ale"
    when "English-Style India Pale Ale", "American-Style India Pale Ale"
      beer.category = "IPA"
    when "Imperial or Double India Pale Ale"
      beer.category = "Double IPA"
    when "American-Style Amber/Red Ale", "Irish-Style Red Ale"
      beer.category = "Amber Ale / Red Ale"
    when "Scotch Ale"
      beer.category = "Scotch Ale"
    when "English-Style Brown Ale", "American-Style Brown Ale", "German-Style Brown Ale / Düsseldorf-Style Altbier"
      beer.category = "Brown Ale / Altbier"
    when "Belgian-Style Dubbel"
      beer.category = "Abbey Dubbel"
    when "Belgian-Style Tripel"
      beer.category = "Abbey Tripel"
    when "Old Ale", "Strong Ale Belgian-Style Pale Strong Ale", "Belgian-Style Dark Strong Ale"
      beer.category = "Old Ale / Strong Ale"
    when "British-Style Barley Wine Ale", "American-Style Barley Wine Ale"
      beer.category = "Barley Wine"
    when "Brown Porter", "Robust Porter", "Smoke Porter", "Baltic-Style Porter", "American-Style Imperial Porter"
      beer.category = "Porter"
    when "Classic Irish-Style Dry Stout"
      beer.category = "Dry Stout"
    when "Oatmeal Stout", "Sweet or Cream Stout"
      beer.category = "Oatmeal Stout"
    when "British-Style Imperial Stout", "American-Style Imperial Stout"
      beer.category = "Imperial Stout"
    when "South German-Style Hefeweizen / Hefeweissbier"
      beer.category = "Hefeweizen"
    when "Light American Wheat Ale or Lager with Yeast", "Light American Wheat Ale or Lager without Yeast"
      beer.category = "American Wheat"
    when "Belgian-Style White (or Wit) / Belgian-Style Wheat"
      beer.category = "Witbier"
    when "South German-Style Dunkel Weizen / Dunkel Weissbier", "Bamberg-Style Weiss (Smoke) Rauchbier (Dunkel or Helles)"
      beer.category = "Dunkelweizen"
    when "South German-Style Weizenbock / Weissbock"
      beer.category = "Weizenbock"
    when "German-Style Pilsener", "Bohemian-Style Pilsener", "American-Style Pilsener", "International-Style Pilsener"
      beer.category = "Pilsener"
    when "Münchner (Munich)-Style Helles", "Bamberg-Style Helles Rauchbier", "Dortmunder / European-Style Export"
      beer.category = "Helles / Dortmuner"
    when "Vienna-Style Lager"
      beer.category = "Vienna"
    when "American-Style Amber Lager"
      beer.category = "Amber Lager"
    when "American-Style Dark Lager"
      beer.category = "Dark Lager"
    when "German-Style Heller Bock/Maibock"
      beer.category = "Maibock"
    when "German-Style Doppelbock"
      beer.category = "Doppelbock"
    when "French & Belgian-Style Saison"
      beer.category = "Saison"
    when "Belgian-Style Lambic", "Belgian-Style Gueuze Lambic"
      beer.category = "Lambic"
    else 
      beer.category = default_style
    end
    beer
  end



end