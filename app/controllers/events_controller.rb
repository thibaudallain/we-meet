class EventsController < ApplicationController
  # before_action :authenticate_user!
  def share
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.create(name: params[:name], phone_number: params[:phone_number])
    @user.save
    @event = Event.new(event_params)
    if @event.save
      # @meeting = Meeting.create(event: @event)
      # @meeting.save
      redirect_to event_share_path(@event)
    else
      redirect_to root_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_time, :deadline)
  end
end
