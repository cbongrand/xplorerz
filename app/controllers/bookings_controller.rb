class BookingsController < ApplicationController
  # after_action :pay, only: :create

  def new
    @booking = Booking.new
  end

  # in the itinerary view, for the booking btn, add a method post

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(state: 'paid')
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @booking = Booking.create!(itinerary: @itinerary, itinerary_sku: @itinerary.sku, amount: @itinerary.price, state: "pending", user: current_user)
    # @booking.user = current_user
    # @booking.itinerary = @itinerary
    # @booking.state = 'pending'
    # @booking.itinereary_sku = @itinerary.sku
    @booking.amount = @itinerary.price
    @booking.save
    # if @booking.save
    #   redirect_to booking_confirmation_path(@booking)
    # else
    #   # this should take the user back to the itinerary he tried to purchase
    #   render 'itineraries/show'
    # end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Full version of #{@itinerary.title}",
        amount: 300,
        currency: 'usd',
        quantity: 1
      }],
      # this determines where the stripe will go after completing the payment
      success_url: "http://localhost:3000/bookings/#{@itinerary.id}/confirm",
      cancel_url: "http://localhost:3000/itineraries/#{@itinerary.id}"
    )

    @booking.update(checkout_session_id: session.id)
    redirect_to new_itinerary_booking_payment_path(@itinerary, @booking)
  end

  # def pay
  #   @booking = current_user.bookings.where(state: 'pending').find(@booking.id)
  # end
end
