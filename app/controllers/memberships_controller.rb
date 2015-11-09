class MembershipsController < ApplicationController
	def create
		group = Group.find(params[:group_id])
		current_user.memberships.create(group_id: group.id)
		respond_to do |format|
			format.html { redirect_to group }
			format.js
		end
	end

	def destroy
		group = Group.find(params[:group_id])
		Membership.find_by(user_id: current_user.id).destroy
		respond_to do |format|
			format.html { redirect_to group }
			format.js
		end
	end
end
