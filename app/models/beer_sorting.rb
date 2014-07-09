class BeerSorting
  def initialize(beers)
    @beers = beers
  end

  def prioritize
    imaged_beers = []
    noimage_beers = []

    @beers.each do |beer|
      if beer.label_url
        imaged_beers << beer
      else
        noimage_beers << beer
      end
    end

    imaged_beers + noimage_beers
  end
end