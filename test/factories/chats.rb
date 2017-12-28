FactoryGirl.define do
  factory :chat do
    chat_to 1
    chat_from 1
    msg "MyText"
    msg_type 1
  end
end
