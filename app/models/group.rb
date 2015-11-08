class Group < ActiveRecord::Base
	belongs_to :user
	belongs_to :event 

	has_many :memberships
	has_many :users, through: :memberships
end
