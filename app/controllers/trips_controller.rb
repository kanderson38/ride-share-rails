class TripsController < ApplicationController
  def show
    trip_id = params[:id]

    @trip = Trip.find_by(id: trip_id)

    unless @trip
      head :not_found
    end
  end

  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      driver = Driver.find_available_driver
      new_trip = Trip.create(driver_id: driver.id, passenger_id: passenger.id, date: Date.today, cost: 0, rating: nil)

      if new_trip
        redirect_to trip_path(new_trip.id)
      else
        render :new
      end
    else
      head :not_found
      return
    end
  end

  def edit
    trip_id = params[:id]

    @trip = Trip.find_by(id: trip_id)

    unless @trip
      head :not_found
    end
  end
end
