# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
