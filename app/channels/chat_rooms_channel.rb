class ChatRoomsChannel < ApplicationCable::Channel
  include Translate
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    current_user.touch
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    UserStatusJob.perform_later(current_user,"offline")
  end

  def send_message(data)
    message = Translate.translate_message(data['message'], current_user.dialect)
    current_user.messages.create!(body: message, chat_room_id: data['chat_room_id'])
    current_user.touch
  end

end
