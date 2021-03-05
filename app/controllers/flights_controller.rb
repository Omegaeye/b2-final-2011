class FlightsController < ApplicationController

  def index
    @flights = Flight.departure_order
  end
end
