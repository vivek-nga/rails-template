class User < ApplicationRecord
  rolify
  #Callbacks handling
  after_create :assign_default_role
  devise :database_authenticatable, :registerable, :recoverable


  #Active model validations
  validates :email, presence: true, email: true
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  #validates_with MyEmailValidator

  has_many :chats
  has_many :conversations_from, class_name: :Conversation, foreign_key: :chat_from, inverse_of: :from_user
  has_many :conversations_to, class_name: :Conversation, foreign_key: :chat_to, inverse_of: :to_user
  
  def assign_default_role
    self.username = self.name if self.name.present?
    self.add_role(:user) if self.roles.blank?
  end

  def name
    "#{self.first_name} #{self.last_name}".try(:strip)
  end

  def name
    "#{self.first_name} #{self.last_name}".try(:strip)
  end


  def conversation_exists? with_user
    self.conversations_from.where(chat_to: with_user.id).count > 0 &&
    self.conversations_to.where(chat_from: with_user.id).count > 0
  end
end
