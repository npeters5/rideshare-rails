class Passenger < ApplicationRecord
  has_many :trips
  validates_presence_of :name, :phone_num

  def total_cost
    return (self.trips.inject(0) { |sum, trip| sum + trip.cost } / 100)
  end

  def request_trip
    trip = Trip.new
    trip.date = DateTime.now
    trip.cost = rand(9999)
    trip.driver_id = Driver.all.sample.id
    trip.passenger_id = self.id
    if trip.save
      return trip
    else
      raise ArgumentError.new("Error: Trip not created.")
    end
  end

  def rate_trip(trip_id)
    #TODO: implement
  end

end
