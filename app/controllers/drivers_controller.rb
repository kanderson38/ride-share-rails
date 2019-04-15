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

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
