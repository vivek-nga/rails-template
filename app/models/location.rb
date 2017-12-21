class Location < ApplicationRecord
  extend FriendlyId
  friendly_id :city, use: :slugged
end
