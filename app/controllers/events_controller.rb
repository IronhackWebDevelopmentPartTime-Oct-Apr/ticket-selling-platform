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
    @event = ActiveSupport::JSON.decode(Event.find(params[:id]))
    unless @event
      render json: {error: "city not found"}, status: 404
      console.log("there are no cities")
      return
    end
    respond_to do |format|
      format.html
      format.json {}
    end
  end
end


