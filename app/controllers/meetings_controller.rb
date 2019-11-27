class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.find(params[:id])
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

private

  def meeting_params
    params.require(:meeting).permit(:attending)
  end
end
