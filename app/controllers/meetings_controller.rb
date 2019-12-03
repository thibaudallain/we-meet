class MeetingsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @meetings_attending = @event.meetings.where.not(address: nil)
    @meetings_declined = @event.meetings.where.not(name: nil)

  end

  def new
    @event = Event.find(params[:event_id])
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new
    @meeting.attending = params[:attending]
    @meeting.organizer = params[:organizer]
    @event = Event.find(params[:event_id])
    @meeting.event = @event
    if @meeting.save
      redirect_to edit_event_meeting_path(@meeting.event, @meeting)
    else
      redirect_to root_path
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @meeting = Meeting.find(params[:id])
  end

  def update
    if params['commit'] == "Je vote"
      @suggested_bars = Meeting.find(params[:id]).event.suggested_bars
      a = []
      @suggested_bars.each do |bar|
        bar.votes += params[bar.bar_id.to_s].to_i
        bar.save
      end
      @meeting = Meeting.find(params[:id])
      @meeting.update(voted: true)
      @event = Event.find(params[:event_id])
      redirect_to event_suggested_bars_path(@event)
    elsif params['commit'] == "Prévenir #{Event.find(params[:event_id]).users.first.name}"
      @meeting = Meeting.find(params[:id])
      @name = params[:name]
      @meeting.assign_attributes(name: @name, photo_number: rand(1..19))
      @meeting.save
      redirect_to root_path
    else
      @meeting = Meeting.find(params[:id])
      if @user = User.find_by(phone_number: params[:phone_number])
        @meeting.assign_attributes(meeting_params)
        @meeting.user = @user
        @meeting.save
        sign_in(@user)
      else
        @user = User.create(name: params[:name], phone_number: params[:phone_number], photo_number: rand(1..8))
        @meeting.assign_attributes(meeting_params)
        @meeting.user = @user
        @meeting.save
        sign_in(@user)
      end
      redirect_to event_meetings_path(@meeting.event)
    end
  end

  def meeting_params
    params.require(:meeting).permit(:address, :available_time)
  end
end
