class GenreCalculator
  def initialize(flavors)
    @flavors = flavors
  end

  def get_best_genre_matches

    raw_genre_list = @flavors.map do |flavor|
      FoodFlavor.find_by_name(flavor).beer_genres
    end

    raw_genre_list.flatten!

    genre_scores = raw_genre_list.inject({}) do |hash, genre|
      hash[genre] ? hash[genre] += 1 : hash[genre] = 1
      hash
    end

    result = genre_scores.sort_by{|k,v| v}.reverse #=> this gives you the nested array. [[name: count],[name:count]]
    result = result[0,4]
    @beer_genres = result.map{ |genre_arr| genre_arr.first }

    @beer_genres.to_json
  end
end
