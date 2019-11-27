class EventsController < ApplicationController
  def share
  end

  def new
    @event = Event.new
  end

#   def create
#     @event = Event.new(event_params)
      #@user = params[:user_id]
#     @event.save
#   end

#   def event_params
#     params.require(:event).permit()
#   end
end
