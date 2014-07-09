class BeerPrioritizer
  def initialize(genre)
    @genre = genre
  end

  def find_beers(@genre)
    beers = Beer.where('category = ?', @genre)
    sort_by_image_availability(beers)
  end

  private

  def sort_by_image_availability(beers)
    have_image_url = []
    no_image_url = []
    beers.each { |beer| beer.label_url ? have_image_url << beer : no_image_url << beer }
    have_image_url + no_image__url
  end
end