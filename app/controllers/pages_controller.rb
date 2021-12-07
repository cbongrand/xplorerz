class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @itineraries = Itinerary.all.limit(3)
    countries_id = CountryItinerary.pluck("DISTINCT country_id")
    @countries = Country.where(id: countries_id).pluck(:name)
  end

  def profile
    @booked_itineraries = current_user.booked_itineraries
    @itineraries = current_user.itineraries
    @itineraries = Itinerary.all
  end
end
