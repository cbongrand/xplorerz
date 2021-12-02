class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @booked_itineraries = current_user.booked_itineraries
    @itineraries = current_user.itineraries
  end
end
