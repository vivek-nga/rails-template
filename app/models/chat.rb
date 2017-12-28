class Chat < ApplicationRecord
  belongs_to :user_to, class_name: 'User', foreign_key: 'chat_to'
  belongs_to :user_from, class_name: 'User', foreign_key: 'chat_from'

  def self.list current_user
    #SELECT chats.* FROM chats WHERE (chat_from = 101 or chat_to = 101)
    Chat.includes(:user_from, :user_to).where('chat_from = ? or chat_to = ?', current_user.id, current_user.id)
    #.group(:chat_from, :chat_to).select('chats.chat_from, chats.chat_to')
  end
end
