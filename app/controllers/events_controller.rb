class EventsController < ApplicationController
  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.json {}
    end
    # render(:json => @events)
  end

  def show
    @event = Event.find(params[:id])
    render(:json => @event)
  end
end
