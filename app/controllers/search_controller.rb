class SearchController < ApplicationController
  def index
   consumer_key = CONFIG["yelp"]["consumer_key"]
   consumer_secret = CONFIG["yelp"]["consumer_secret"]
   token = CONFIG["yelp"]["token"]
   token_secret = CONFIG["yelp"]["token_secret"]
   api_host = 'api.yelp.com'
   consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

  path = "/v2/search?term=beer+stores&location=94127"
  @response = access_token.get(path).body
  end
end