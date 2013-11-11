class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def show
    id = params[:id]
    if (not Event.exists?(id))
    	flash[:notice] = "Event does not exist"
    	redirect_to '/events'
    	return
    end
    @event = Event.find(id)
  end
end

