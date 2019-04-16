class HomepagesController < ApplicationController
  def index
    @drivers_num = Driver.all.count
    @trips_num = Trip.all.count
    @passengers_num = Passenger.all.count
  end
end
