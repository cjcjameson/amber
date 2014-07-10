class OauthWrapper
  def initialize(params)
    @consumer_key = ENV["yelp_consumer_key"] || CONFIG["yelp"]["consumer_key"]
    @consumer_secret = ENV["yelp_consumer_secret"] || CONFIG["yelp"]["consumer_secret"]
    @token = ENV["yelp_token"] || CONFIG["yelp"]["token"]
    @token_secret = ENV["yelp_token_secret"] || CONFIG["yelp"]["token_secret"]
    @params = params
  end

  def yelp_it(api_host)
    access_token = get_token(api_host)
    search_term = format_search_term(@params[:genre])
    path = "/v2/search?term=#{search_term}+beer&location=#{@params[:zipcode]}"
    access_token.get(path)
  end

  private
  def get_token(api_host)
    consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, @token, @token_secret)
  end

  def format_search_term(params)
    params.gsub(' ', '+')
  end

end
