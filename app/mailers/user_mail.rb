class UserMail < ApplicationMailer
	def purchaseMail(user)
		@user=user
		
		user.signed_in? ? 
			mail(to:@user.mail subject: "Purchase done") 
			: redirect_to new_user_session_path
	end
end
