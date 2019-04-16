class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify
  validates :name, presence: true
  validates :phone_num, presence: true

  def amount_charged
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    return format("$%.2f", sum)
  end
end
