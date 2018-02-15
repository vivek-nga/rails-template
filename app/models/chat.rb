class Chat < ApplicationRecord

  belongs_to :conversation, optional: true
  belongs_to :user, optional: true

  def self.list current_user
    Chat.all
    #SELECT chats.* FROM chats WHERE (chat_from = 101 or chat_to = 101)
    #Chat.includes(:user_from, :user_to).where('chat_from = ? or chat_to = ?', current_user.id, current_user.id)
    #.group(:chat_from, :chat_to).select('chats.chat_from, chats.chat_to')
  end
end
