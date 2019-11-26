require 'json'
require 'open-uri'

class GooglePlacesServices
  def initialize(params)
    @location = params[:location]
    @key = params[:key]
  end

  def places_api_call
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@location}&radius=500&type=bar&fileds=price_level,photos,formatted_address,name,rating,opening_hours&key=#{@key}"
    places_serialized = open(url).read
    places = JSON.parse(places_serialized)
  end
end
