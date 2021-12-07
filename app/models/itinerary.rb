class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :country_itineraries
  has_many :countries, through: :country_itineraries
  has_many :itinerary_tags
  has_many :tags, through: :itinerary_tags
  has_many :users, through: :bookings
  has_many :bookings
  acts_as_likeable
  validates :title, presence: true
  validates :description, presence: true
  scope :trendy, -> {order(likers_count: :desc).limit(3)}


  def booked?(current_user)
    current_user_bookings = current_user.booked_itineraries
    current_user_bookings.any? { |user_booking| user_booking.id == id }
  end

  has_one_attached :photo

end
