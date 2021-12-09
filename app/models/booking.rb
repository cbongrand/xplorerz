class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  has_many :likes
  monetize :amount_cents
end
