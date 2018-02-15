FactoryBot.define do
  factory :conversation do
    chat_to 1
    chat_from 1
    key "MyString"
    deleted false
  end
end
