class FlightsController < ApplicationController

  def index
    @flights = Flight.pass_count_order
  end

  def show
    @flight = Flight.find(params[:id])
    @passengers = @flight.adult_passengers
  end
end
