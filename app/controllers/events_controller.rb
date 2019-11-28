class EventsController < ApplicationController
  # before_action :authenticate_user!
  def share
    @event = Event.find(params[:event_id])
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

  private

  def event_params
    params.require(:event).permit(:start_time, :deadline)
  end
end
