class MeetingsController < ApplicationController

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
    @meeting.save
    redirect_to edit_event_meeting_path(@meeting.event, @meeting)
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    if @meeting.attending
      redirect_to event_meetings_path(@meeting.event)
    else
      redirect_to root_path
    end
  end
end
