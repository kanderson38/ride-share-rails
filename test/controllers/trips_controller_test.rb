require "test_helper"

describe TripsController do
  # let (:trip) {
  #   Trip.create(driver: )
  # }

  describe "show" do
      it "can get a valid trip" do
      get passenger_path(passenger.id)
      must_respond_with :success
    end
  end

  describe "edit" do
    it "can get the edit page for an existing trip" do
      # get edit_passenger_path(passenger.id)
      must_respond_with :success
    end
  end

  describe "update" do
    it "updated the trip info" do
      passenger = Passenger.first
      passenger.name = "new name"
      passenger.phone_num = "new phone"

      passenger.save!

      expect(Passenger.first.name).must_equal "new name"
      expect(Passenger.first.phone_num).must_equal "new phone"
    end
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
