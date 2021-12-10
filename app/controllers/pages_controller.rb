class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @itineraries = Itinerary.all.limit(3)
    countries_id = CountryItinerary.pluck("DISTINCT country_id")
    @countries = Country.where(id: countries_id)
  end

  def profile
    bookings = current_user.bookings.select { |booking| booking.state == "paid" }
    @booked_itineraries = bookings.map { |booking| booking.itinerary}
    @itineraries = current_user.itineraries
    @itineraries = Itinerary.all
  end
end
