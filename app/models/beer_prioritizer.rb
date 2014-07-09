class BeerPrioritizer
  def initialize(genre)
    @genre = genre
  end

  def find_beers
    beers = Beer.where('category = ?', @genre)
    sort_by_image_availability(beers)
  end

  private

  def sort_by_image_availability(beers)
    have_label_url = []
    no_label_url = []
    beers.each { |beer| beer.label_url ? have_label_url << beer : no_label_url << beer }
    have_label_url + no_label_url
  end
end