class ItinerariesController < ApplicationController
  before_action :find_itinerary, only: %i[edit show update]

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

  #### add delete function

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    redirect_to profile_path
  end

  private

  def find_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:title, :description)
  end
end
