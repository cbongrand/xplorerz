class ItinerariesController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
      sql_query = "countries.name ILIKE :query"
      @itineraries = Itinerary.joins(:countries).where(sql_query, query: "%#{params[:query]}%")
    else
      @itineraries = Itinerary.all
    end
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description)
  end
end
