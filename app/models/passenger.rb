class Passenger < ApplicationRecord
  has_many :trips
  validates_presence_of :name, :phone_num

  def total_cost
    return (self.trips.inject(0) { |sum, trip| sum + trip.cost } / 100)
  end

  def rate_trip(trip_id)
    #TODO: implement
  end

end
