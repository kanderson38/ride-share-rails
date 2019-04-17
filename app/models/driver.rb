class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    sum -= 1.65
    sum *= 0.8
    return format("$%.2f", sum)
  end

  def average_ratings
    sum = 0
    unless self.trips.count == 0
      self.trips.each do |trip|
        sum += trip.rating
      end
      average = sum / self.trips.count
      return average
    end
    return 0
  end

  def self.find_available_driver
    available_driver = Driver.find_by(active: true)
    return available_driver
  end
end
