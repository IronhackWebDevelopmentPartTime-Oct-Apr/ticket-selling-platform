class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    UserMail.purchase_mail(current_user).deliver_later
    flash[:notice] = "Purchase successful! Thank you for your money MUAJAJAJAJAJAJAJAJAJAJAJA"
    redirect_to action: "show", controller: "events", id: params[:id]
  end
end
