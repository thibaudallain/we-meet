class SuggestedBarsController < ApplicationController
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
    @bars = @response['results']
    @bars = @bars.map do |bar|
      if Bar.where(name: bar['name']) != []
        a = Bar.where(name: bar['name'])[0]
        Bar.where(name: bar['name'])[0].update(rating: bar['rating'], price_level: bar['price_level'])
        bar = a
      else
        photo_reference = bar['photos'].nil? ? nil : bar['photos'][0]['photo_reference']
        new_bar = Bar.create(
        name: bar['name'],
        price_level: bar['price_level'],
        rating: bar['rating'],
        address: bar['vicinity'],
        photo_reference: photo_reference
        )
        attach_photo(new_bar, new_bar.photo_reference)
        bar = new_bar
      end
    end
    @bars = @bars.first(5)
  end

  private

  def retrieve_bars(location)
    @key = ENV['GOOGLE_PLACES_API_KEY']
    GooglePlacesService.new(location: location, key: @key).places_api_call
  end

  def attach_photo(bar, photo_reference)
    @key = ENV['GOOGLE_PLACES_API_KEY']
    GooglePhotosService.new(key: @key, photo_reference: photo_reference).photos_api_attach_photo(bar)
  end
end
