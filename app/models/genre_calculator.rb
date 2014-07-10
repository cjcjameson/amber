class GenreCalculator
  def initialize(flavors)
    @flavors = flavors
  end

  def get_best_genre_matches
    matches = @flavors.flat_map { |flavor| FoodFlavor.where('name = ?', flavor) }.
                       flat_map { |flavor| flavor.matches }
    genres = get_genres(matches)
    top_four(genres)
  end

private
  def get_genres(matches)
    genres = matches.map do |match|
      { genre: BeerGenre.find(match.beer_genre_id), intensity: match.intensity }
    end
    genres.inject({}) do |result, match|
      if result[match[:genre]]
        result[match[:genre]] += match[:intensity] 
      else
        result[match[:genre]] = match[:intensity]
      end
      result
    end
  end

  def top_four(genres)
    genres.sort_by { |_, value| value }.
            reverse.
            first(4).
            map{ |genres| genres.first }
  end

end
