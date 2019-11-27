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

private

  def meeting_params
    params.require(:meeting).permit(:attending)
  end
end
