class CommentsController < ApplicationController
	def create
		@event = Event.find(params[:event_id])
		@comment = @event.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save 
			redirect_to event_path(@event)
		else
			render 'events/show'
		end
	end

	def destroy
	end


	private 

	def	comment_params
		params.require(:comment).permit(:commenter, :content)
	end

end
