require 'rails_helper'

RSpec.describe Message, type: :model do
  subject {
    described_class.new(body: "my message", user_id: FactoryGirl.create(:user), chat_room_id: FactoryGirl.create(:chat_room))
  }
  describe "Record Validations" do
    it "is not valid without a body" do
      subject.body = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a user_id" do
      subject.user_id = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a chat_room_id" do
      subject.chat_room_id = ""
      expect(subject).to_not be_valid
    end
  end
end
