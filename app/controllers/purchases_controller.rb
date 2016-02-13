class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    flash[:notice] = "Purchase succesful"
    redirect_to action: "show", controller: "events", id: params[:id]
  end
end
