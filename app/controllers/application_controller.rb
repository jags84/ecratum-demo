class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_session

  def verify_session
    if controller_name == 'chat_rooms'
      if session[:current_user_id].nil?
        redirect_to new_user_path
      end
    end
  end

  def current_user
    @user.find(session[:current_user_id])
  end

end
