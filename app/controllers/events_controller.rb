class EventsController < ApplicationController
	def index
		@events = Event.all 
	end

	def show
		@event = Event.find(params[:id])
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
		params.require(:event).permit(:title, :desc)
	end

end
