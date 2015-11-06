namespace :hackernews do 
	desc "Get the first page of news from Hackernews"
	task get: :environment do 
		News.get_news
		puts "Complete"
	end
end