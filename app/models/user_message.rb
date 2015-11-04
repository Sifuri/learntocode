class UserMessage < ActiveRecord::Base
	belongs_to :giver, class_name: "User"
	belongs_to :receiver, class_name: "User"
	belongs_to :message 

	validates :receiver_id, presence: true 
	validates :giver_id, presence: true 
	validates :message, presence: true 
end
