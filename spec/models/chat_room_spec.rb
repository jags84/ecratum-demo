require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  subject {
    described_class.new(title: "my chat room")
  }
  describe "Record Validations" do
    it "is not valid without a title" do
      subject.title = ""
      expect(subject).to_not be_valid
    end
  end
end
