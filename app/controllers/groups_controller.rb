class GroupsController < ApplicationController

	def show
		@group = Group.find(params[:id])
	end


	def create
		@event = Event.find(params[:event_id])
		@group = @event.groups.create(group_params)
		@group.memberships.create(user_id: current_user.id, host: current_user.id)
		if @group.save 
			redirect_to event_path(@event)
		else
			render 'groups/show'
		end
	end

	def destroy
	end

	private 

	def group_params
		params.require(:group).permit(:title, :desc, :qty)
	end


end
