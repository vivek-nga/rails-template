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


  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def name
    "#{self.first_name} #{self.last_name}".try(:strip)
  end
end
