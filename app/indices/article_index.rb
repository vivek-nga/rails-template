ThinkingSphinx::Index.define :article, :with => :active_record do
  # fields
  indexes title, :sortable => true
  indexes body
  indexes user.first_name, :as => :user_first_name, :sortable => true
  indexes user.last_name, :as => :user_last_name, :sortable => true
  # attributes
  has user_id,  :type => :integer
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end