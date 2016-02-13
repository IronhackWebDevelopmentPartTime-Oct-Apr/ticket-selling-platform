class EventsController < ApplicationController
  def index
    @event = Event.find("55")
    # other_response = Venue.find_by(city: 'rockford')

    render(:json => @event)
  end
end
