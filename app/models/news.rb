require 'ruby-hackernews'

class News < ActiveRecord::Base
	def self.get_news
		RubyHackernews::Entry.all.each do |e|
			News.create(title: e.link.title, url: e.link.href)
		end
	end


end
