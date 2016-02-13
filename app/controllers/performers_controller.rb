class PerformersController < ApplicationController
  def index
    @performers = Performer.all
    render(:json => @performers)
  end

  def show
    @performer = Performer.find(params[:id])
    render(:json => @performer)
  end
end
