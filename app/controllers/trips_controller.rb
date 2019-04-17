class TripsController < ApplicationController
  def show
    trip_id = params[:id]

    @trip = Trip.find_by(id: trip_id)

    unless @trip
      head :not_found
    end
  end
end
