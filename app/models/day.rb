class Day < ApplicationRecord
  belongs_to :itinerary
  validates :city, presence: true
  validates :description, presence: true
  validates :restaurant_info, presence: true
  validates :activity_info, presence: true
  # validates :order, presence: true
  validates :extra_info, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_address?
end
