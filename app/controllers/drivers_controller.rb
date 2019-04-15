class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.new(driver_params)

    if driver.name != ""
      driver.save

      redirect_to drivers_path, flash: { alert: "driver added successfully" }
    else
      redirect_to new_driver_path
    end
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)

    if !@driver
      redirect_to drivers_path, flash: { error: "Could not find driver with id: #{driver_id}" }
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if !@driver
      redirect_to drivers_path, flash: { alert: "No such driver" }
    end
  end

  def update
    driver = Driver.find_by(id: params[:id])

    if driver
      Driver.update(driver_params)

      redirect_to driver_path(params[:id])
    else
      redirect_to drivers_path, flash: { alert: "No such driver" }
    end
  end

  #   def destroy
  #     driver_id = params[:id]
  #     driver = Driver.find_by(id: driver_id)

  #     if driver

  #       driver.destroy
  #       redirect_to drivers_path, flash: { alert: "driver successfully deleted" }
  #     else
  #       redirect_to drivers_path, flash: { alert: "No such driver" }
  #     end
  #   end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
