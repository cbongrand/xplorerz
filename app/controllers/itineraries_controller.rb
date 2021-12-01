class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new(itinerary_params)
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    if @itinerary.save
      redirect_to itinerary_path
    else
      render new
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description)
  end
end
