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
    @event = ActiveSupport::JSON.decode(Event.find(params[:id]))
    respond_to do |format|
      format.html
      format.json {}
    end
  end

end
