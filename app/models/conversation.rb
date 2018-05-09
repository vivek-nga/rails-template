class Conversation < ApplicationRecord
  has_secure_token :key
  belongs_to :to_user, class_name: 'User', foreign_key: 'chat_to', inverse_of: :conversations_from, optional: true
  belongs_to :from_user, class_name: 'User', foreign_key: 'chat_from', inverse_of: :conversations_to, optional: true 
  has_many :chats

end
