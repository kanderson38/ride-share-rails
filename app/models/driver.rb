class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  def total_earnings
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    return sum
  end

  def average_ratings
    sum = 0
    self.trips.each do |trip|
      sum += trip.rating
    end
    average = sum / self.trips.count
    return average
  end
end
