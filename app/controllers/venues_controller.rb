class VenuesController < ApplicationController
  def index
    @venue = Venue.find("1")
    # other_response = Venue.find_by(city: 'rockford')

    render(:json => @venue)
  end
end
