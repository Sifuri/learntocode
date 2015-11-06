class EventsController < ApplicationController
	def index
		meetup_api = MeetupApi.new
		@events = meetup_api.open_events({zip: '11106'})["results"]
		@custom_events = Event.all
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
		params.require(:event).permit(:title, :desc, :topic, :zip, :distance)
	end

end
