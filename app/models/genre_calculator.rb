class GenreCalculator
  def initialize(flavors)
    @flavors = flavors
  end

  def get_best_genre_matches
    flavors = retrieve_flavors(@flavors)
    matches = get_matches(flavors)
    genres = get_genres(matches)
    sort_and_extract_genres(genres)
  end

private

  def retrieve_flavors(flavors)
    flavors.flat_map { |flavor| FoodFlavor.where('name = ?', flavor) }
  end

  def get_matches(flavors)
    flavors.flat_map { |flavor| flavor.matches }
  end

  def get_genres(matches)
    genres = matches.map do |match|
      { genre: BeerGenre.find(match.beer_genre_id), intensity: match.intensity }
    end
    genres.inject({}) do |result, match|
      result[match[:genre]] ? result[match[:genre]] += match[:intensity] : result[match[:genre]] = match[:intensity]
      result
    end
  end

  def sort_and_extract_genres(genres)
    sorted_genres = genres.sort_by{|k,v| v}.reverse
    top_four_genres = sorted_genres[0,4]
    top_four_genres.map{ |genre_array| genre_array.first }

  end

end
