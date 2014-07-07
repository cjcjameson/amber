class SearchController < ApplicationController
  def index
  end

  def result
   consumer_key = CONFIG["yelp"]["consumer_key"]
   consumer_secret = CONFIG["yelp"]["consumer_secret"]
   token = CONFIG["yelp"]["token"]
   token_secret = CONFIG["yelp"]["token_secret"]
   api_host = 'api.yelp.com'
   consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/search?term=#{params[:search_term]}&location=#{params[:zipcode]}"
    response = JSON.parse(access_token.get(path).body)
    @latitude = response["region"]["center"]["latitude"]
    @longitude = response["region"]["center"]["longitude"]
    @response_data = response["businesses"]
    render "result"
  end
end