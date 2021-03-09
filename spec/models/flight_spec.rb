require 'rails_helper'

RSpec.describe Flight, type: :model do
  before :each do
    Flight.destroy_all
    Passenger.destroy_all
    FlightPassenger.destroy_all

    @flight1 = Flight.create!(number: "1", date: "01/01/10", time: "10:00 AM", departure: "Denver", arrival: "Cancun")
    @flight2 = Flight.create!(number: "2", date: "01/01/10", time: "11:00 AM", departure: "Denver", arrival: "New York City")
    @flight3 = Flight.create!(number: "3", date: "01/01/10", time: "9:00 AM", departure: "Manhattan", arrival: "San Franscisco")
    @flight4 = Flight.create!(number: "4", date: "01/01/10", time: "1:00 PM", departure: "Phoenix", arrival: "Salt Lake City")
    @flight5 = Flight.create!(number: "5", date: "01/01/10", time: "2:00 PM", departure: "Las Vegas", arrival: "Bahamas")
    @passenger1 = Passenger.create!(name: "Khoa", age: 35)
    @passenger2 = Passenger.create!(name: "Jen", age: 35)
    @passenger3 = Passenger.create!(name: "Dmytri", age: 21)
    @passenger4 = Passenger.create!(name: "Lana", age:19)
    @passenger5 = Passenger.create!(name: "Caroline", age: 2)
    @passenger6 = Passenger.create!(name: "Ethen", age: 2)
    @passenger7 = Passenger.create!(name: "Ziky", age: 9)
    @passenger8 = Passenger.create!(name: "Andrew", age: 29)
    @passenger9 = Passenger.create!(name: "Doug", age: 29)
    @passenger10 = Passenger.create!(name: "Jake", age: 30)
    @passenger11 = Passenger.create!(name: "Olivia", age: 9)
    @passenger12 = Passenger.create!(name: "Lily", age: 9)

    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger6)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger7)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger8)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger9)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger10)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger11)
  end

  describe "Testing Relationships" do
    it {should have_many(:flight_passengers)}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "Flight method tests " do
    it "flight.ordered by departure city" do
      expect(Flight.departure_order).to eq([@flight1, @flight2, @flight5, @flight3, @flight4])
    end

    it "Flight.pass_count_order order by passenger count" do
      expect(Flight.pass_count_order).to eq([@flight1, @flight5, @flight2, @flight3])
      FlightPassenger.create!(flight: @flight5, passenger: @passenger11)
      expect(Flight.pass_count_order).to eq([@flight1, @flight5, @flight2, @flight3])
    end

    it "Flight.adult_passengers gives only age > 18" do
      expect(@flight1.adult_passengers).to eq([@passenger1, @passenger8])
      expect(@flight2.adult_passengers).to eq([@passenger3, @passenger10])
      expect(@flight3.adult_passengers).to eq([@passenger4])
      expect(@flight5.adult_passengers).to eq([@passenger2, @passenger9])
      expect(@flight4.adult_passengers).to eq([])
    end

    it "Flight.average_age of adult" do
      expect(@flight1.average_age_adult.round(1)).to eq(32)
      expect(@flight2.average_age_adult.round(1)).to eq(25.5)
      expect(@flight3.average_age_adult.round(1)).to eq(19)
      expect(@flight5.average_age_adult.round(1)).to eq(32)
    end

  end

end
