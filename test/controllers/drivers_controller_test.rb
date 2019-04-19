require "test_helper"

describe DriversController do
  let (:driver) {
    Driver.create(name: "Tom", vin: "6ERL")
  }

  describe "index" do
    it "can get index" do
      get drivers_path
      must_respond_with :success
    end

    it "can get the root path" do
      get root_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "can get a valid task" do
      get driver_path(driver.id)
      must_respond_with :success
    end
  end

  describe "edit" do
    it "can get the edit page for an existing task" do
      get edit_driver_path(driver.id)
      must_respond_with :success
    end
  end

  describe "update" do
    let(:driver_data) {
      { driver: {
        name: "new name",
        vin: "new VIN",
      } }
    }
    it "updated the driver's info" do
      driver = Driver.first

      patch driver_path(driver.id), params: driver_data

      expect(Driver.first.name).must_equal "new name"
      expect(Driver.first.vin).must_equal "new VIN"
    end

    it "redirects for a nonexistent driver" do
      patch driver_path(12345), params: driver_data
      must_respond_with :redirect
    end
  end

  describe "new" do
    it "displays the page" do
      get new_driver_path
      must_respond_with :success
    end
  end

  describe "create" do
    let(:driver_data) {
      {
        driver: {
          name: "Schmitty Tarleton",
          vin: "123",
        },
      }
    }
    it "adds a driver to the database" do
      expect {
        post drivers_path, params: driver_data
      }.must_change "Driver.count", 1
    end
  end

  describe "destroy" do
    it "removes the driver from the database" do
      doomed_driver = Driver.create!(name: "Tom Dead", vin: "SDFGSAFDG")
      expect {
        delete driver_path(doomed_driver)
      }.must_change "Driver.count", -1
    end
  end
end
