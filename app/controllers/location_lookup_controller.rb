class LocationLookupController < ApplicationController
  respond_to :json

  def result
    api_host = 'api.yelp.com'
    oauth = OauthWrapper.new(params)
    parsed_json = JSON.parse(oauth.yelp_it(api_host).body)

    if parsed_json
        respond_with format_response(parsed_json)
    else
        render status: 400
    end
  end

  private
  def format_response(parsed_json)
    latitude = parsed_json["region"]["center"]["latitude"]
    longitude = parsed_json["region"]["center"]["longitude"]
    parsed_json_data = parsed_json["businesses"]
    response = {latitude: latitude, longitude: longitude, data: parsed_json_data}
  end
end