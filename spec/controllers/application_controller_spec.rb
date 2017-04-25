require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "current_user helper_method" do
    before :each do
      @user = FactoryGirl.create(:user)
      session[:current_user_id] = @user.id
    end

    it "return current_user if session is created" do
      expect(controller.view_context.current_user).to eq(@user)
    end

    it "return current_user nil if session is not created" do
      session[:current_user_id] = nil
      expect(controller.view_context.current_user).to eq(nil)
    end

  end

end
