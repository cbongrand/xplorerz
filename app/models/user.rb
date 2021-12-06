class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :booked_itineraries, through: :bookings, class_name: 'Itinerary', source: :itinerary

  # created itineraries
  has_many :itineraries
  validates :email, uniqueness: true

  # profile photo
  has_one_attached :photo
end
