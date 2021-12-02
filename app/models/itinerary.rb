class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :days

  has_many :days, dependent: :destroy
  has_many :country_itineraries
  has_many :countries, through: :country_itineraries
  has_many :tags, through: :initerary_tags
  has_many :users, through: :bookings
  has_many :bookings
  validates :title, presence: true
  validates :description, presence: true
end
