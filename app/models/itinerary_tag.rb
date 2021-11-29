class ItineraryTag < ApplicationRecord
  belongs_to :itinerary
  belongs_to :tag
end
