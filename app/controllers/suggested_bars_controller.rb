class SuggestedBarsController < ApplicationController
  private

  def retrieve_bars
    @key = ENV['GOOGLE_PLACES_API_KEY']
    GooglePlacesService.new(location: "48.870299,2.375993", key: @key).places_api_call
  end
end
