class EventsController < ApplicationController
  def index
    @event = Event.find("3036691")
    # other_response = Venue.find_by(city: 'rockford')

    render(:json => @event)
  end
end
