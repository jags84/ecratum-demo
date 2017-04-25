require 'rails_helper'

RSpec.describe Translate do
  include Translate

  describe "Translate API Validations" do

    it "must have API_URL_FUN constant variable defined" do
      expect(Translate::API_URL_FUN).to_not be(nil)
    end

    it "must have API_URL_DEGRAEVE constant variable defined" do
      expect(Translate::API_URL_DEGRAEVE).to_not be(nil)
    end

    it "must return nil if dialect is not passed" do
      message = FactoryGirl.create(:message)
      translated_message = Translate.translate_message(message.body)
      expect(translated_message).to eq(nil)
    end

    it "must return nil if message is nil" do
      message = FactoryGirl.create(:message)
      translated_message = Translate.translate_message(nil)
      expect(translated_message).to eq(nil)
    end

    it "must return nil if message is empty" do
      message = FactoryGirl.create(:message)
      translated_message = Translate.translate_message("")
      expect(translated_message).to eq(nil)
    end

    it "must translate text to Yoda dialect" do
      message = FactoryGirl.create(:message)
      translated_message = Translate.translate_message(message.body,'Yoda')
      expect(translated_message).to eq("Force be with you,Juan,  my name is")
    end

    it "must translate text to Valley Girl dialect" do
      message = FactoryGirl.create(:message)
      translated_message = Translate.translate_message(message.body,'Valley Girl')
      expect(translated_message).to eq("Hello, like, wow my name is Juan")
    end

    it "must translate text to Binary Code dialect" do
      message = FactoryGirl.create(:message)
      translated_message = Translate.translate_message(message.body,'Binary Code')
      expect(translated_message).to eq("10010001100101110110011011001101111101100 11011011111001 1101110110000111011011100101 11010011110011 1001010111010111000011101110")
    end

  end
end
