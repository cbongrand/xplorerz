class Country < ApplicationRecord
  validates :name, presence: true
  has_many :country_itineraries
end
