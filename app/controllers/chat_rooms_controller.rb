class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(:messages).take
  end
end
