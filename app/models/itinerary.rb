class Itinerary < ApplicationRecord
  has_many :days
  has_many :countries, through: :country_itineraries
  has_many :tags, through: :initerary_tags
  has_many :users, through: :bookings
  has_many :bookings
  validates :title, presence: true
  validates :discription, presence: true
end
