class EventsController < ApplicationController
  def index
    @perfomers = Performer.get_band_id("New York Mets")
#    respond_to do |format|
#      format.html
#      format.json {}
#    end
     render(:json => @perfomers)
  end

  def show
    @event = Event.find(params[:id])
    unless @event
    	render json: {error: "city not found"}, status: 404
    	console.log("there are no cities")
    	return
    end
    render :json => @events
  end
end


