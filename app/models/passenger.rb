class Passenger < ApplicationRecord
  has_many :trips

  def amount_charged
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    return sum
  end


end
