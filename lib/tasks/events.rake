namespace :events do 
	desc "Get events from meetup.com"
	task get: :environment do 
		Event.get_events
		puts "Complete"
	end
	task photos: :environment do 
		Event.get_photos 
		puts "Complete"
	end
end