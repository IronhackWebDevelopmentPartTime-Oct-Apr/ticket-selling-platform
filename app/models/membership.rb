class Membership < ActiveRecord::Base

	def self.get_favs_list(user_id)
		favs = where user_id: user_id
	end
end
