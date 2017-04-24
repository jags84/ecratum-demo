class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_session
  before_action :set_cookie
  helper_method :current_user

  def verify_session
    if controller_name == 'chat_rooms'
      if session[:current_user_id].nil?
        redirect_to new_user_path
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id])
  end

  def set_cookie
    if session[:current_user_id]
      cookies[:user_session] = { :value => current_user.id,:expires => 1.year.from_now}
    end
  end

end
