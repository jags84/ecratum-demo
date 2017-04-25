require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(username: "my_username", dialect:"yoda")
  }
  describe "Record Validations" do
    it "is not valid without a username" do
      subject.username = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a dialect" do
      subject.dialect = ""
      expect(subject).to_not be_valid
    end

    it "is not valit with username with spaces" do
      subject.username = "my username"
      expect(subject).to_not be_valid
    end

    it "must have a avatar picture after create user" do
      user = FactoryGirl.create(:user)
      expect(user.picture).to_not be(nil)
    end

    it "must have a dialect icon" do
      user = FactoryGirl.create(:user)
      expect(user.dialect_icon).to_not be(nil)
    end

    it "must have a Yoda icon when dialect is Yoda" do
      user = FactoryGirl.create(:user)
      user.dialect = "Yoda"
      user.save
      expect(user.dialect_icon).to eq("yoda.png")
    end

    it "must have a Valley Girl icon when dialect is Valley Girl" do
      user = FactoryGirl.create(:user)
      user.dialect = "Valley Girl"
      user.save
      expect(user.dialect_icon).to eq("tiara.png")
    end

    it "must have a Binary Code icon when dialect is Binary Code" do
      user = FactoryGirl.create(:user)
      user.dialect = "Binary Code"
      user.save
      expect(user.dialect_icon).to eq("dexter.png")
    end
  end
end
