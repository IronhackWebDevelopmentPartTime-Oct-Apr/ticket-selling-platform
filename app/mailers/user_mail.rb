class UserMail < ApplicationMailer
	def purchase_mail(user)
		mail(to: user.email, subject: "Purchase done")
	end
end
