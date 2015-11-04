class User < ActiveRecord::Base
	# Validations 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, presence: true
	validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }


	has_secure_password

	# Events
	has_many :user_events
	has_many :users, through: :user_events

	# Courses
	has_many :courses

	# Friends 
	has_many :friends
	has_many :friend_connections, through: :friends 
	has_many :inverse_friends, class_name: "Friend", foreign_key: "connection_id"
	has_many :inverse_friend_connections, through: :inverse_friends, source: :user 

	# Friends Request
	has_many :requests
	has_many :req_connections, :through => :requests
	has_many :inverse_requests, :class_name => "Request", :foreign_key => "connection_id"
	has_many :inverse_req_connections, :through => :inverse_requests, :source => :user

	# Message Relations
	has_many :messages 


	# Bootcamp Relations
	has_many :bootcamps




	def cancel_request(other_user)
		inverse_requests.find_by(user_id: other_user.id).destroy 
	end

	def made_requests?(other_user)
		requests.find_by(connection_id: other_user.id) || inverse_requests.find_by(user_id: other_user.id)
	end

	def request_friendship(other_user)
		requests.create(connection_id: other_user.id)
	end

	def accept_friendship(other_user)
		friends.create(connection_id: other_user.id)
		cancel_request other_user
	end

	def are_friends_with?(other_user)
		friends.find_by(connection_id: other_user.id) || inverse_friends.find_by(user_id: other_user.id)
	end
end
