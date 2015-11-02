module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id 
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def	current_user?(user)
		user == current_user
	end


	def user_signed_in?
		!current_user.nil?
	end

	# def update_last_seen
	# 	current_user.update_attribute(:last_seen, Time.now) if current_user
	# end

end