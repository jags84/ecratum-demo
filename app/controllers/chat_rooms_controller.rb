class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(:messages).take
    @message = Message.new
    @online_users = []
  end
end
