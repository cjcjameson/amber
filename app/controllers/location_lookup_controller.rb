class LocationLookupController < ApplicationController
  respond_to :json

  def result
    api_host = 'api.yelp.com'
    oauth = OauthWrapper.new(params)
    response = JSON.parse(oauth.yelp_it(api_host).body)

    if response
        latitude = response["region"]["center"]["latitude"]
        longitude = response["region"]["center"]["longitude"]
        response_data = response["businesses"]
        response = {latitude: latitude, longitude: longitude, data: response_data}
        respond_with response
    else
        render status: 400
    end
  end
end