class BeerPrioritizer
  def initialize(genre)
    @genre = genre
  end

  def find_beers
    beers = Beer.where('category = ?', @genre)
    have_labels, no_labels = beers.partition{|beer| beer.label_url != nil}
    (have_labels.shuffle! + no_labels.shuffle!).first(20)
  end
end