class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  # after_save ThinkingSphinx::RealTime.callback_for(:article)
end
