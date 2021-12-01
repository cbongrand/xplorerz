class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  # in the itinerary view, for the booking btn, add a method post

  def confirm
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @booking.user = current_user
    @booking.itinerary = @itinerary
    @booking.save
    if @booking.save
      redirect_to booking_confirmation_path(@booking)
    else
      # this should take the user back to the itinerary he tried to purchase
      render 'itineraries/show'
    end
  end
end
