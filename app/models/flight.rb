class Flight < ApplicationRecord
  has_many :flight_passengers, dependent: :destroy
  has_many :passengers, through: :flight_passengers

  def self.departure_order
    order(:departure)
  end

  def self.pass_count_order
    joins(:passengers).group(:id).order("passengers.count DESC")
  end
end
