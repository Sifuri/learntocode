class EventsController < ApplicationController
	def index
		if params[:q]
			@events = Event.search(params).paginate(page: params[:page], per_page: 15)
		else
			@events = Event.paginate(page: params[:page], per_page: 15)
		end
	end

	def show
		@event = Event.find(params[:id])
		@comment = Comment.new
	end

	def new
		@event = Event.new
	end

	def edit
	end

	def update
	end

	def create 
		@event = Event.new(event_params)
	end

	def destroy
		Event.find(params[:id]).destroy 
	end

	private

	def event_params
		params.require(:event).permit(:title, :desc, :city, :state)
	end

end
