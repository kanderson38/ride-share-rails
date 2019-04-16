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
    # Your tests go here
  end

  describe "new" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
