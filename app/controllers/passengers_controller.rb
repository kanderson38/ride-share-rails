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

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    if !@passenger
      redirect_to passengers_path, flash: { alert: "No such passenger" }
    end
  end

  def update
    passenger = Passenger.find_by(id: params[:id])

    if passenger
      passenger.update(passenger_params)

      redirect_to passenger_path(params[:id])
    else
      redirect_to passenger_path, flash: { alert: "No such passenger" }
    end
  end

  def destroy
    passenger_id = params[:id]
    passenger = Passenger.find_by(id: passenger_id)

    if passenger
      passenger.destroy
      redirect_to passengers_path, flash: { alert: "passenger successfully deleted" }
    else
      redirect_to passengers_path, flash: { alert: "No such passenger" }
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end



end
