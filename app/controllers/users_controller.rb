class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # Create Session
      session[:current_user_id] = @user.id
      redirect_to chat_room_path(ChatRoom.take)
    else
      render :new
    end
  end

  def destroy
    # Set nil to session and current user
    session[:current_user_id] = nil
    current_user = nil
    redirect_to new_user_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username,:dialect)
    end
end
