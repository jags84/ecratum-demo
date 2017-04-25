require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do

  describe "GET #show" do
    before :each do
      @user = FactoryGirl.create(:user)
      session[:current_user_id] = @user.id
      @chat_room = FactoryGirl.create(:chat_room)
    end

    it "returns http success" do
      get :show, params: {id: @chat_room.id}
      expect(response).to have_http_status(:success)
    end

    it "assigns a chat_room to @chat_room" do
      get :show, params: {id: @chat_room.id}
      expect(assigns(:chat_room)).to be_a(ChatRoom)
    end

    it "renders the :show template" do
      get :show, params: {id: @chat_room.id}
      expect(response).to render_template("chat_rooms/show")
    end
  end

end
