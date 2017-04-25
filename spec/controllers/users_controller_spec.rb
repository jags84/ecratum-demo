require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template("users/new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        chat_room = FactoryGirl.create(:chat_room)
        user = FactoryGirl.create(:user)
        post :create, params: {user:{username:user.username, dialect: user.dialect}}
        expect(response.status).to eq(302)
      end

      it "redirects to the ChatRoom page" do
        chat_room = FactoryGirl.create(:chat_room)
        user = FactoryGirl.create(:user)
        post :create, params: {user:{username:user.username, dialect: user.dialect}}
        expect(response).to redirect_to(chat_room_path(ChatRoom.take))
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        chat_room = FactoryGirl.create(:chat_room)
        user = FactoryGirl.create(:user)
        post :create, params: {user:{username: "", dialect: user.dialect}}
        expect(response.status).to eq(200)
      end
      it "re-renders the :new template" do
        chat_room = FactoryGirl.create(:chat_room)
        user = FactoryGirl.create(:user)
        post :create, params: {user:{username: "", dialect: user.dialect}}
        expect(response).to render_template("users/new")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it "deletes the user session" do
      delete :destroy, params: {id: @user.id }
      expect(session[:current_user_id]).to be(nil)
    end

    it "redirects to users#new" do
      delete :destroy, params: {id: @user.id }
      expect(response).to redirect_to new_user_path
    end
  end

end
