class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order("id")
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)

    if !@passenger
      head :not_found
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    success = @passenger.save

    if success 
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    if !@passenger
      redirect_to passengers_path, flash: { alert: "No such passenger" }
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])


    if @passenger
      success = @passenger.update(passenger_params)
      if success
        redirect_to passenger_path(params[:id])
      else
        render :edit
      end
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
