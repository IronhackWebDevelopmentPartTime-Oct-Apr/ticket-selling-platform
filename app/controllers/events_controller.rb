class EventsController < ApplicationController
  def index
    @events = Recommendation.get_recommendations([35,42])
    # respond_to do |format|
    #  format.html
    #  format.json {}
    #end
     render(:json => @events)
  end

  def show
    @event = Event.find(params[:id])
    render(:json => @event)
  end
  
end
