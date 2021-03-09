class FlightPassengersController < ApplicationController

  def destroy
    @flight = Flight.find(params[:id])
    FlightPassenger.find_by(flight_id: params[:id], passenger_id: params[:remove]).destroy
    redirect_to flight_path(@flight)
  end
end
