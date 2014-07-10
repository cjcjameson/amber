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

  def self.set_beer_category(beer, default_category)
    style_list = JSON.parse(File.read("#{Rails.root}/db/categories_and_styles.json"))
    beer.category = default_category
    style_list.each do |category, styles|
      beer.category = category if styles.include?(beer.style)
    end
    beer
  end

end