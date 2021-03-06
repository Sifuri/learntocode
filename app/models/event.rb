class Event < ActiveRecord::Base
	has_many :groups, dependent: :destroy
	has_many :users, through: :groups

	has_many :comments, dependent: :destroy

	def self.search(params)
		all.where("lower(title) LIKE ?", params[:q].downcase+"%") if params[:q]
	end

	def self.get_events
		meetup_api = MeetupApi.new
		meetup_api.open_events({category: 34})["results"].each do |e|
			Event.create(title: e["name"], desc: e["description"], city: e["venue"]["city"], state: e["venue"]["state"], group_id: e["group"]["id"], rsvp: e["yes_rsvp_count"], time: e["time"], time_zone: e["time_zone"]) if e["venue"]
		end
	end

	def self.get_photos
		meetup_api = MeetupApi.new
		Event.all.each do |e|
			if meetup_api.groups({group_id: e.group_id})
				meetup_api.groups({group_id: e.group_id})["results"].each do |x|
					e.url = x["group_photo"]["photo_link"] if x["group_photo"]
					e.save
				end
			end
		end
	end
end

