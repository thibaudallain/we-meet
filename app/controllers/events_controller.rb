class EventsController < ApplicationController
  # before_action :authenticate_user!
  def share
    @event = Event.find(params[:event_id])
    @meetings = @event.meetings
  end

  def login
  end

  def share_again
    @event = Event.find(params[:event_id])
    redirect_to event_meetings_path(@event)
  end

  def new
    @event = Event.new
  end

  def create
    start = Time.zone.local(Time.now.year, Time.now.month, Time.now.day, params["event"]["start_time"].split(":")[0].to_i, params["event"]["start_time"].split(":")[1].to_i)
    deadline = start - 3600 * params["event"]["available_time"].to_i
    if @user = User.find_by(phone_number: params[:phone_number])
      @user.update(name: params[:name])
      sign_in(@user)
    else
      @user = User.create(name: params[:name], phone_number: params[:phone_number], photo_number: rand(1..19))
      sign_in(@user)
    end
    @event = Event.new(start_time: start, deadline: deadline, date: Date.today)
    if @event.save
      @meeting = Meeting.create(event_id: @event.id, user_id: @user.id, attending: true, address: params[:address], organizer: true)
      redirect_to event_share_path(@event)
    else
      redirect_to root_path
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(shared: true)
    sleep(3)
    redirect_to event_suggested_bars_path(@event)
  end

  def show
    if user_signed_in?
      @event = Event.find(params[:id])
      # marker du point de départ
      # @starting_point = @event.meetings.where(user: current_user)
      @starting_point = @event.meetings.find_by(user: current_user)# A CHANGER
      # marker du bar choisi
      if @event.suggested_bars.where(chosen: true).length == 0
        @chosen_bar = @event.suggested_bars.max_by{ |k| k[:votes] }
        @chosen_bar.update(chosen: true) unless @event.suggested_bars.where(chosen: true).length > 0
      else
        @chosen_bar = @event.suggested_bars.where(chosen: true).first
      end
      @ending_point = @chosen_bar.bar
      @bar_name = @ending_point.name
      @points = [ @starting_point, @ending_point ]
      @bar = Bar.find(@chosen_bar.bar_id)
      # @event = Event.geocoded # returns gps coordinates
      # # @event = current_user.meetings.find(event: @event).where(suggested_bar.chosen == true)

       @markers = [
        {
          lat: @ending_point.latitude,
          lng: @ending_point.longitude,
          infoWindow: render_to_string(partial: "info_window_event", locals: { bar: @bar })
        },

        {
          lat: @starting_point.latitude,
          lng: @starting_point.longitude,
          infoWindow: render_to_string(partial: "info_window")

        }]

    @city_mapper_url = "https://citymapper.com/directions?startcoord=#{@starting_point.latitude}%2C#{@starting_point.longitude}&startaddress=#{@starting_point.address}&endcoord=#{@ending_point.latitude}%2C#{@ending_point.longitude}&endname=#{@bar_name}&endaddress=#{@bar.address}"
    elsif params["login_show"]
      @event = Event.find(params["id"])
      @user = User.where(phone_number: params["login_show"])[0]
      sign_in(@user)
      redirect_to event_path(@event)
    else
      @event = Event.find(params["id"])
      @users = @event.meetings.map { |meeting| meeting.user }
      render :login
    end

    # A DECOMMENTER
    # Citywrapper.configure do |c|
    #   c.api_key = ENV['CITY_MAPPER_API_KEY']
    # end

    # @t = Citywrapper::TravelTime.between(
    #   start_coordinates: [@starting_point.latitude, @starting_point.longitude],
    #   end_coordinates: [@ending_point.latitude, @ending_point.longitude],
    #   time: DateTime.now.iso8601,
    #   time_type: :arrival
    # )


  end

  private

  def event_params
    params.require(:event).permit(:start_time, :deadline)
  end
end
