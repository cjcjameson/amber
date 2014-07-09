class LocationLookupController < ApplicationController
  respond_to :json

  def result
    consumer_key = CONFIG["yelp"]["consumer_key"]
    consumer_secret = CONFIG["yelp"]["consumer_secret"]
    token = CONFIG["yelp"]["token"]
    token_secret = CONFIG["yelp"]["token_secret"]
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)
    search_term = params[:genre].gsub(' ', '+')
    path = "/v2/search?term=#{search_term}+beer&location=#{params[:zipcode]}"
    response = JSON.parse(access_token.get(path).body)
    latitude = response["region"]["center"]["latitude"]
    longitude = response["region"]["center"]["longitude"]
    response_data = response["businesses"]
    response = {latitude: latitude, longitude: longitude, data: response_data}
    respond_with response
  end
end