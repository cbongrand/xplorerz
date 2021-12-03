class ItinerariesController < ApplicationController
  before_action :find_itinerary, only: %i[edit show update]

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    @itinerary.save
    if @itinerary.save
      redirect_to new_itinerary_day_path(@itinerary)
    else
      render :new
    end
  end

  def edit; end

  def update
    @itinerary.update(itinerary_params)
    # @itinerary.user = current_user
    @itinerary.save
    if @itinerary.save
      redirect_to new_itinerary_day_path(@itinerary)
    else
      render :new
    end
  end

  def show; end

  private

  def find_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:title, :description)
  end
end
