class SuggestedBarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @event = Event.find(params[:event_id])
    @result_lat = Geocoder::Calculations.geographic_center(@event.meetings.where(attending: true))[0]
                                        .to_s
                                        .split(".")
                                        .map { |string| string.slice(0..5) }
                                        .join(".")
    @result_long = Geocoder::Calculations.geographic_center(@event.meetings.where(attending: true))[1]
                                         .to_s
                                         .split(".")
                                         .map { |string| string.slice(0..5) }
                                         .join(".")
    @response = retrieve_bars("#{@result_lat},#{@result_long}")
    @result = @response['results']

  end

  private

  def retrieve_bars(location)
    @key = ENV['GOOGLE_PLACES_API_KEY']
    GooglePlacesService.new(location: location, key: @key).places_api_call
  end
end
