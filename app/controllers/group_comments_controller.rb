class GroupCommentsController < ApplicationController
	def create
		@group = Group.find(params[:group_id])
		@group_comment = @group.group_comments.create(group_comment_params)
		@group_comment.user_id = current_user.id
		if @group_comment.save
			redirect_to group_path(@group)
		else
			render 'groups/show'
		end
	end

	def destroy

	end


	private 

	def	group_comment_params
		params.require(:group_comment).permit(:commenter, :content)
	end
end
