class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def show
    begin
      id = params[:id]
      @event = Event.find(id)
    rescue
      flash[:notice] = "Event does not exist"
      redirect_to(events_path)
    end
  end
end

