class EventsController < ApplicationController
  # before_action :authenticate_user!
  def share
  end

  def new
    @event = Event.new
  end

  def create
    if @user = User.find_by(phone_number: params[:phone_number])
      sign_in(@user)
    else
      @user = User.create(name: params[:name], phone_number: params[:phone_number])
      sign_in(@user)
    end
    @event = Event.new(event_params)
    @event.date = Date.today
    if @event.save
      @meeting = Meeting.create(event_id: @event.id, user_id: @user.id, attending: true, address: params[:address], organizer: true)
      redirect_to event_share_path(@event)
    else
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])

    # marker du point de départ
    # @starting_point = @event.meetings.where(user: current_user)
    @starting_point = @event.meetings.find_by(user: User.first)# A CHANGER

    # marker du bar choisi
    @ending_point = @event.suggested_bars.find_by(chosen: true).bar

    @points = [ @starting_point, @ending_point ]

    # @event = Event.geocoded # returns gps coordinates
    # # @event = current_user.meetings.find(event: @event).where(suggested_bar.chosen == true)
    @markers = @points.map do |point|
      {
        lat: point.latitude,
        lng: point.longitude
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end

    # clean up

    Citywrapper.configure do |c|
      c.api_key = ENV['CITY_MAPPER_API_KEY']
    end

    @t = Citywrapper::TravelTime.between(
      start_coordinates: [@starting_point.latitude,@starting_point.longitude],
      end_coordinates: [@ending_point.latitude, @ending_point.longitude],
      time: DateTime.now.iso8601,
      time_type: :arrival
    )

  end

  private

  def event_params
    params.require(:event).permit(:start_time, :deadline)
  end
end
