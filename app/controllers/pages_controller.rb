require_relative "../services/google_places"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @bars = retrieve_bars
  end

  private

  def retrieve_bars
    @key = ENV['GOOGLE_PLACES_API_KEY']
    GooglePlacesServices.new(location: "48.870299,2.375993", key: @key).places_api_call
  end
end
