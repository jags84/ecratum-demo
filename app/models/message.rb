class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  validates :body, :user_id, :chat_room_id, presence: true
end
