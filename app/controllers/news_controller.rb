require 'ruby-hackernews'

class NewsController < ApplicationController
  def index
    @news = RubyHackernews::Entry.all
  end
end
