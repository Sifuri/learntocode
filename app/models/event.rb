class Event < ActiveRecord::Base
	has_many :user_events
	has_many :users, through: :user_events

	def self.get_events
		meetup_api = MeetupApi.new
		meetup_api.open_events({category: 34, venue_visibility: "public"})["results"].each do |e|
			Event.create(title: e["name"], desc: e["description"], city: e["venue"]["city"], state: e["venue"["state"]]) if e["venue"]
		end
	end
end

			# event_photo: meetup_api.groups({group_id: e["group"]["id"]})["group_photo"]["highres_link"]