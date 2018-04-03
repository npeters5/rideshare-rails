class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
    return (self.trips.inject(0) { |sum, trip| sum + trip.cost } / 100)
  end

  def average_rating
    return (self.trips.inject(0) { |sum, trip| sum + trip.rating } / trips.count).round(2)
  end

end
