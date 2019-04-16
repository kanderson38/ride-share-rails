class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order("id")
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    success = @driver.save
    if success
      redirect_to drivers_path
    else
      render :new
    end
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)

    if !@driver
      redirect_to drivers_path
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if !@driver
      redirect_to drivers_path
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    if @driver
      success = @driver.update(driver_params)
      if success
        redirect_to driver_path(params[:id])
      else
        render :edit
      end
    else
      redirect_to drivers_path
    end
  end

  def destroy
    driver_id = params[:id]
    driver = Driver.find_by(id: driver_id)

    if driver
      driver.destroy
      redirect_to drivers_path, flash: { alert: "driver successfully deleted" }
    else
      redirect_to drivers_path, flash: { alert: "No such driver" }
    end
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
