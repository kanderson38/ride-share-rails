class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  # def assign_driver
  #   assigned = Driver.find_available_driver
  # end
end
