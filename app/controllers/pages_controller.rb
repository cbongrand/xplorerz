class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @days = []
    @itineraries = Itinerary.all.limit(3)
    # # @itinerary = Itinerary.find(params[:id])
    # @itineraries.each do |x|
    #   @days << Day.where(x.id)
    # end
  end

  def profile
    @booked_itineraries = current_user.booked_itineraries
    @itineraries = current_user.itineraries
    @itineraries = Itinerary.all
  end
end
