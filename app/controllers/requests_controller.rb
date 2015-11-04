class RequestsController < ApplicationController
	def create
		@user = User.find(params[:connection_id])
		current_user.requests.create(connection_id: @user.id) 
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

	def destroy
		@user = User.find(params[:connection_id])
		current_user.cancel_request @user 
		respond_to do |format|
			format.html { redirect_to current_user }
			format.js 
		end
	end
end
