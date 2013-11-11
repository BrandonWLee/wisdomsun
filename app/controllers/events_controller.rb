class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def show
<<<<<<< HEAD
    begin
      id = params[:id]
      @event = Event.find(id)
    rescue
      flash[:notice] = "Event does not exist"
      redirect_to(events_path)
    end
=======
    id = params[:id]
    if (not Event.exists?(id))
    	flash[:notice] = "Event does not exist"
    	redirect_to '/events'
    	return
    end
    @event = Event.find(id)
>>>>>>> origin/master
  end
end

