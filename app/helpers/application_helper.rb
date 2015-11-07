module ApplicationHelper
	def groupMsgs(all_msgs)
		grouped = {}
		
		all_msgs.each { |msg| 
	        id = 0
	        if msg.giver_id.to_i == current_user.id.to_i
	          id = msg.receiver_id;
	        else 
	          id = msg.giver_id;
	        end
	        msg = { :about => msg, :content => Message.find(msg[:message_id])[:content] }
	        grouped[id.to_s.to_sym] ||=  []
	        grouped[id.to_s.to_sym] << msg

	    }

	    grouped.each { |k,v|
	    	user = User.find(k.to_s)
	    	sorted = v.sort_by { |x| 
	    		x[:about][:created_at]
	    	}
	    	grouped[k] = {
	    		:user => {
	    			:gravatar => gravatar_url_only(user),
	    			:profile => user_path(user),
	    			:name => user.name,
	    			:id => user.id
	    		},
	    		:msgs => sorted
	    	}
	    }
	end
end
