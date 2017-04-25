class UserStatusJob < ApplicationJob
  queue_as :default

  def perform(user,status)
    if status == 'online'
      ActionCable.server.broadcast "chat_rooms_1_channel", user: render_user(user), status: 'online', user_id: user.id
    elsif status == 'offline'
      ActionCable.server.broadcast "chat_rooms_1_channel", user: user.id, status: 'offline'
    end

  end

  private
  def render_user(user)
    UsersController.render partial: 'users/user', locals: {user: user}
  end
end
