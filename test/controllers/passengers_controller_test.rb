require "test_helper"

describe PassengersController do
  let (:passenger) {
    Passenger.create(name: "Nilai",  phone_num: "123456")
  }

  describe "index" do
    it "can get index" do
      get passengers_path
      must_respond_with :success
    end

    it "can get the root path" do
      get root_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "can get a valid passenger" do
      get passenger_path(passenger.id)
      must_respond_with :success
    end
  end

  describe "edit" do
    it "can get the edit page for an existing task" do
      get edit_passenger_path(passenger.id)
      must_respond_with :success
    end
  end

  describe "update" do
    it "updated the passenger info" do
      passenger = Passenger.first
      passenger.name = "new name"
      passenger.phone_num = "new phone"

      passenger.save!

      expect(Passenger.first.name).must_equal "new name"
      expect(Passenger.first.phone_num).must_equal "new phone"
    end
  end

  describe "new" do
    it "can get to new page" do
      get new_passenger_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds a passenger to the database" do
      expect {
        Passenger.create!(name: "test", phone_num: "23432")
      }.must_change "Passenger.count", 1
    end
  end

  describe "destroy" do
    it "removes the passenger from the database" do
      dead_passenger = Passenger.create!(name: "Tom Dead", phone_num: "SDFGSAFDG")
      expect {dead_passenger.destroy}.must_change "Passenger.count", -1
    end
  end
end
