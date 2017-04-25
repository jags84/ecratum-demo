FactoryGirl.define do
  factory :message do
    body "Hello, my name is Juan"
    user
    chat_room
  end
end
