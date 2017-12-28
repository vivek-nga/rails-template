class Article < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true,
                    length: { minimum: 5 }
  # after_save ThinkingSphinx::RealTime.callback_for(:article)
end
