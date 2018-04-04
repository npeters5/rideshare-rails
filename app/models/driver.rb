class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
    return (self.trips.inject(0) { |sum, trip| sum + earnings_per_trip(trip.cost) } / 100).round(2)
  end

  def average_rating
    return (self.trips.inject(0) { |sum, trip| sum + trip.rating } / trips.count).round(2)
  end

  def earnings_per_trip(amount)
    return (amount - 165) * 0.8
  end

end
