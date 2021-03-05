require 'rails_helper'

RSpec.describe 'As visitor, when I visit flight index page' do
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
    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight5, passenger: @passenger5)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger6)
    FlightPassenger.create!(flight: @flight4, passenger: @passenger7)
    visit "/flights/#{@flight1.id}"
  end

  it "I should see flight stats and passengers name and age" do
    expect(page).to have_content("Departure")
    expect(page).to have_content("Arrival")
    expect(page).to have_content("Time")
    expect(page).to have_content("Date")
    expect(page).to have_content("Number")
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight1.date)
    expect(page).to have_content(@flight1.time)
    expect(page).to have_content(@flight1.arrival)
    expect(page).to have_content(@flight1.departure)
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger1.age)
    expect(page).to_not have_content(@passenger6.age)
    expect(page).to_not have_content(@passenger6.age)
    expect(page).to have_content("Average Age of Passengers")
    expect(page).to have_content(@flight1.passengers.average_age)
  end

  it "I can remove passenger from flight" do
    expect(page).to have_button("Remove Passenger")
    click_button("Remove Passenger")
    expect(current_path).to eq(flight_path(@flight1))
    expect(page).to_not have_content(@passenger1.name)
  end

end
