class FlightsController < ApplicationController

  def index
    @flights = Flight.departure_order
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def destroy
    @flight = Flight.find(params[:id])
    @passenger = Passenger.find(params[:remove])
    FlightPassenger.destroy(@passenger.id)
    redirect_to flight_path(@flight)
  end
end
