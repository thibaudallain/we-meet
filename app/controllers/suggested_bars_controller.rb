class SuggestedBarsController < ApplicationController
  def login
  end

  def index
    if user_signed_in?
      @event = Event.find(params[:event_id])
      if @event.meetings.geocoded.where(attending: true).length == 1
        position_centrale = @event.meetings.geocoded.where(attending: true).first
      else
        position_centrale = Geocoder::Calculations.geographic_center(@event.meetings.geocoded.where(attending: true))
      end
      if Bar.near(position_centrale, 0.5).length >= 5
        @message = "pas d'API"
        @bars = Bar.near(position_centrale, 0.5).first(5)
      else
        if position_centrale.class == Meeting
          @result_lat = position_centrale.latitude
                                              .to_s
                                              .split(".")
                                              .map { |string| string.slice(0..5) }
                                              .join(".")
          @result_long = position_centrale.longitude
                                               .to_s
                                               .split(".")
                                               .map { |string| string.slice(0..5) }
                                               .join(".")
        else
          @result_lat = position_centrale[0]
                                              .to_s
                                              .split(".")
                                              .map { |string| string.slice(0..5) }
                                              .join(".")
          @result_long = position_centrale[1]
                                               .to_s
                                               .split(".")
                                               .map { |string| string.slice(0..5) }
                                               .join(".")
        end
        @message = "API"
        @response = retrieve_bars("#{@result_lat},#{@result_long}")
        @bars = @response['results']
        @bars = @bars.first(5)
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
            unless photo_reference.nil?
              attach_photo(new_bar, new_bar.photo_reference)
            end
            bar = new_bar
          end
        end
      end
      unless @event.suggested_bars.length > 0
        @bars.each do |bar|
          SuggestedBar.create(
            event_id: @event.id,
            bar_id: bar.id,
            votes: 0,
            chosen: false
            )
        end
      end
      @markers_bars = @bars.map do |bar|
        {
          lat: bar.latitude,
          lng: bar.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
          image_url: helpers.asset_url('icon_bar.png')
        }
      end
      @markers_people = @event.meetings.where(attending: true).geocoded.map do |person|
        {
          lat: person.latitude,
          lng: person.longitude,
          infoWindow: render_to_string(partial: "info_window_coming", locals: { user: person.user }),
          image_url: helpers.asset_url('avatar_sb.png')
        }
      end
      @markers = @markers_people + @markers_bars
      @meeting = Meeting.where(event: @event, user: current_user)[0]
    elsif params["login_sb"]
      @event = Event.find(params["event_id"])
      @user = User.where(phone_number: params["login_sb"])[0]
      sign_in(@user)
      redirect_to event_suggested_bars_path(@event)
    else
      @event = Event.find(params["event_id"])
      @users = @event.meetings.where(attending: true).map { |meeting| meeting.user }
      render :login
    end
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
