class ItinerariesController < ApplicationController
  before_action :find_itinerary, only: %i[edit show update]
  after_action :update_sku, only: :create
  after_action :update_price, only: :create

  def index
    countries_id = CountryItinerary.pluck("DISTINCT country_id")
    @countries = Country.where(id: countries_id).pluck(:name)
    tags_id = ItineraryTag.pluck("DISTINCT tag_id")
    @tags = Tag.where(id: tags_id).pluck(:name)
    if params[:query].present? && params[:filter].present?
      @query = params[:query]
      @country = Country.find(params[:query])
      @filter = params[:filter]
      sql_query = "countries.id = :query AND tags.name ILIKE :filter"
      @itineraries = Itinerary.joins(:countries, :tags).where(sql_query, query: params[:query], filter: "%#{params[:filter]}%")
    elsif params[:query].present? && !params[:filter].present?
      @query = params[:query]
      @country = Country.find(params[:query])
      sql_query = "countries.id = :query"
      @itineraries = Itinerary.joins(:countries).where(sql_query, query: params[:query])
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
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def show
    @days = Itinerary.find(params[:id]).days
    @markers = @days.geocoded.map do |day|
      {
        lat: day.latitude,
        lng: day.longitude
      }
    end
  end

  # Find out if an objects likes
  def liked?
    @user = current_user
    @itinerary.liked_by?(@user)
  end

  # All likers
  def all_likes
    @itinerary.likers(User.all)
  end

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
    params.require(:itinerary).permit(:title, :description, :photo, country_ids: [], tag_ids: [])
  end

  def update_sku
    @itinerary.sku = "itin#{:id}"
    @itinerary.save
  end

  def update_price
    @itinerary.price_cents = 300
    @itinerary.save
  end
end
