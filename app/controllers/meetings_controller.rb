class MeetingsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @meeting = Meeting.new
  end

  def show
    @event = Event.find(params[:event_id])
    @meeting = Meeting.find(params[:id])
    @users = User.all
    @meeting.attending = params[:attending]
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
    if params['commit'] == "je vote"
      @suggested_bars = Meeting.find(params[:id]).event.suggested_bars
      a = []
      @suggested_bars.each do |bar|
        bar.votes += params[bar.bar_id.to_s].to_i
        bar.save
      end
      @meeting = Meeting.find(params[:id])
      @meeting.update(voted: true)
      redirect_to event_suggested_bars_path(Event.find(params[:event_id]))
    else
      @meeting = Meeting.find(params[:id])
      @meeting.update(meeting_params)
      if @meeting.attending
        redirect_to event_meetings_path(@meeting.event)
      else
        redirect_to root_path
      end
    end
  end
end
