class EventsController < ApplicationController
  def share
  end

  def new
    @event = Event.new
  end


end
