class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order("id")
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)

    if !@passenger
      redirect_to passengers_path, flash: { error: "Could not find passenger with id: #{passenger_id}" }
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)

    if passenger.name != ""
      passenger.save

      redirect_to passengers_path, flash: { alert: "passenger added successfully" }
    else
      redirect_to new_passenger_path
    end
  end
end
