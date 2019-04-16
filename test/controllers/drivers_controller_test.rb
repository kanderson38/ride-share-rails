require "test_helper"

describe DriversController do
  let (:driver) {
    Driver.create(name: "Tom", vin: "123456")
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
    it "updated the driver's info" do
      driver = Driver.first
      driver.name = "new name"
      driver.vin = "new VIN"

      driver.save!

      expect(Driver.first.name).must_equal "new name"
      expect(Driver.first.vin).must_equal "new VIN"
    end
  end

  describe "new" do
    it "displays the page" do
      get new_driver_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds a driver to the database" do
      expect {
        Driver.create!(name: "new", vin: "vin")
      }.must_change "Driver.count", 1
    end
  end

  describe "destroy" do
    it "removes the driver from the database" do
      doomed_driver = Driver.create!(name: "Tom Dead", vin: "SDFGSAFDG")
      expect {
        doomed_driver.destroy
      }.must_change "Driver.count", -1

      expect
    end
  end
end
