class FlightsController < ApplicationController

  def index
    @flights = Flight.departure_order
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
