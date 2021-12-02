class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
