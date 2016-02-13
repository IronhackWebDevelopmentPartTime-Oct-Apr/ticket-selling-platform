class MembershipsController < ApplicationController

	def new
		@membership = Membership.new
	end

	def create
        membership = Membership.new(membership_params)
		membership.band_id = Performer.get_band_id(membership_params[:band_name])
		membership.user_id = current_user.id 
		membership.save
		redirect_to profile_path
	end

private

  	def membership_params
    	params.require(:membership).permit(:band_name)
  	end


end
