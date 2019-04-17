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
      driver = Driver.find_available_driver
      success = Trip.create(driver_id: driver, passenger_id: params[:passenger_id], cost: 0, rating: nil)

      if success
        redirect_to trips_path
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
