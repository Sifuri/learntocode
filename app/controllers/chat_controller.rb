class ChatController < ApplicationController

  def get
    latest = params[:latest] ||  "2014-11-05 02:52:00"
    id = params[:giver]
    unless User.exists?(id)
      render []
      return
    end
    render :json => current_user.messages_received.where("created_at > ?", latest).where(giver_id: id).map { |msg| {msg: msg.message.subject, latest: msg.message.created_at } }
  end

  def sendMsg
    user = User.find_by_id params[:to]
    unless user
      render []
      return
    end

    msg = Message.create(subject: params[:msg])
    current_user.give_message(user,msg)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

end
