class UsersController < ApplicationController
  # Like something
  def like
    @user = current_user
    @itinerary = Itinerary.find(params[:itinerary_id])
    @user.like!(@itinerary)
    redirect_to @itinerary
  end

  # Stop liking
  def unlike
    @user = current_user
    @itinerary = Itinerary.find(params[:itinerary_id])
    @user.unlike!(@itinerary)
    redirect_to @itinerary
  end

  # Likes?
  def like?
    @user = current_user
    @itinerary = Itinerary.find(params[:itinerary_id])
    @user.likes?(@itinerary)
  end
end
