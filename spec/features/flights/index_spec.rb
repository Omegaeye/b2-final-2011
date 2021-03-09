require 'rails_helper'

RSpec.describe 'As visitor, when I visit flight index page' do
  before :each do
    Flight.destroy_all
    Passenger.destroy_all
    FlightPassenger.destroy_all

    @flight1 = Flight.create!(number: "20", date: "01/01/10", time: "10:00 AM", departure: "Denver", arrival: "Cancun")
    @flight2 = Flight.create!(number: "21", date: "01/01/10", time: "11:00 AM", departure: "Kansas City", arrival: "New York City")
    @flight3 = Flight.create!(number: "22", date: "01/01/10", time: "9:00 AM", departure: "Manhattan", arrival: "San Franscisco")
    @flight4 = Flight.create!(number: "23", date: "01/01/10", time: "1:00 PM", departure: "Phoenix", arrival: "Salt Lake City")
    @flight5 = Flight.create!(number: "24", date: "01/01/10", time: "2:00 PM", departure: "Las Vegas", arrival: "Bahamas")
    @passenger1 = Passenger.create!(name: "Khoa", age: 35)
    @passenger2 = Passenger.create!(name: "Jen", age: 35)
    @passenger3 = Passenger.create!(name: "Dmytri", age: 21)
    @passenger4 = Passenger.create!(name: "Lana", age:19)
    @passenger5 = Passenger.create!(name: "Caroline", age: 2)
    @passenger6 = Passenger.create!(name: "Ethen", age: 2)
    @passenger7 = Passenger.create!(name: "Ziky", age: 9)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger6)
    FlightPassenger.create!(flight: @flight4, passenger: @passenger7)
    visit "/flights"
  end

  it "I see all flights and details ordered by alphabetical departure city" do
      expect(page).to have_content("Departure")
      expect(page).to have_content("Arrival")
      expect(page).to have_content("Time")
      expect(page).to have_content("Date")
      expect(page).to have_content("Number")
  end

  it "test within" do
    within "#flight-#{@flight1.id}" do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight1.date)
      expect(page).to have_content(@flight1.time)
      expect(page).to have_content(@flight1.arrival)
      expect(page).to have_content(@flight1.departure)
    end
  end

  # it "I see Flights order by alphabetical for departure city and passenger counts" do
  #   expect(@flight5.departure).to appear_before(@flight3.departure)
  #   expect(@flight1.arrival).to appear_before(@flight2.arrival)
  # end

  it "I see Flights order by passenger count and departure city alphabetical " do
    expect(@flight1.departure).to appear_before(@flight5.departure)
    expect(@flight5.departure).to appear_before(@flight2.departure)
    expect(@flight2.departure).to appear_before(@flight3.departure)
    expect(@flight3.departure).to appear_before(@flight4.departure)

  end
end
