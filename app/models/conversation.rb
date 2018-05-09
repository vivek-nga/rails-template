class Conversation < ApplicationRecord
  after_initialize :generate_key
  belongs_to :to_user, class_name: 'User', foreign_key: 'chat_to', inverse_of: :conversations_from, optional: true
  belongs_to :from_user, class_name: 'User', foreign_key: 'chat_from', inverse_of: :conversations_to, optional: true 
  has_many :chats

  def generate_key
    return if self.key.present?
    key = nil
    loop do
      key = SecureRandom.hex(10)
      break key unless self.class.where(key: key).exists?
    end
    self.key = key
  end
  
end
