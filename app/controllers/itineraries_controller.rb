class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end
  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new
  end
end
