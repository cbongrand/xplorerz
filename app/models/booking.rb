class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  has_many :likes
end
