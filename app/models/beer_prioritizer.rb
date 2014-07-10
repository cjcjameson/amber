class BeerPrioritizer
  def initialize(genre)
    @genre = genre
  end

  def find_beers
    random_twenty = Beer.where('category = ?', @genre).sample(20)
    sort_by_image_availability(random_twenty)
  end

  def sort_by_image_availability(beers)
    have_label_url = beers.select{ |beer| beer if beer.label_url }
    no_label_url = beers.select{ |beer| beer unless beer.label_url }
    have_label_url + no_label_url
  end
end