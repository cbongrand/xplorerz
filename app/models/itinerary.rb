class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :country_itineraries
  has_many :countries, through: :country_itineraries
  has_many :itinerary_tags
  has_many :tags, through: :itinerary_tags
  has_many :users, through: :bookings
  has_many :bookings
  has_one_attached :photo
  acts_as_likeable
  validates :title, presence: true
  validates :description, presence: true
  scope :trendy, -> { order(likers_count: :desc).limit(3) }
  monetize :price_cents
  before_save :assign_price, :assign_sku

  def assign_price
    self.price = 3
  end

  def assign_sku
    self.sku = 'Itinerary'
  end

  def booked_and_payed?(current_user)
    current_user_itineraries = current_user.booked_itineraries
    current_user_bookings = current_user.bookings
    booked = current_user_itineraries.any? { |user_booking| user_booking.id == id }
    array_of_bookings = current_user_bookings.find_all { |user_booking| user_booking.itinerary_id == id }
    payed = array_of_bookings.any? {|user_booking| user_booking.state == "paid"}
    booked && payed
  end


  #def booked?(current_user)
    #ids = current_user.bookings.where(state: "paid").pluck(:itinerary_id)
    #current_user_bookings = Itinerary.where(id: ids)
    #current_user_bookings.any? { |user_booking| user_booking.id == id }
  #end
end
