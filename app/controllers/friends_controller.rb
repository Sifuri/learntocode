class FriendsController < ApplicationController
	def create
		user = User.find(params[:connection_id])
		current_user.accept_friendship(user)
		respond_to do |format|
			format.html { redirect_to current_user }
			format.js
		end
	end

	def destroy
	end
end
