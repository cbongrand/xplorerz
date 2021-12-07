class DaysController < ApplicationController

  # before_action :pluralize

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day.itinerary = @itinerary
    if @day.save
      redirect_to new_itinerary_day_path(@itinerary)
    else
      render :new
    end
  end

  def edit
    @day = Day.find(params[:id])
    @itinerary = @day.itinerary
  end

  def show
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    if @day.update(day_params)
      redirect_to new_itinerary_day_path(@day.itinerary)
    else
      render :new
    end
  end

  private

  def day_params
    params.require(:day).permit(:city, :description, :restaurant_info, :activity_info, :extra_info, :order)
  end

  # def pluralize
    # @itinerary = Itinerary.find(params[:itinerary_id])
    # @itinerary.days = @days
    # @count = @days.count
    # if @count == 1
      # @day_text = "DAY"
    # else
      # @day_text = "DAYS"
    # end
  # end

end
