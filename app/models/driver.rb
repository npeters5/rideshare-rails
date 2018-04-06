class Driver < ApplicationRecord
  has_many :trips
  validates_presence_of :name, :vin

  def total_earnings
    return (self.trips.inject(0) { |sum, trip| sum + earnings_per_trip(trip.cost) } / 100).round(2)
  end

  def average_rating
    sum = 0
    self.trips.each do |trip|
      if trip.rating
        sum += trip.rating
      end
    end
    sum.round(2)
  end

  def earnings_per_trip(amount)
    return (amount - 165) * 0.8
  end

end
