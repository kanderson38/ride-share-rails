require "test_helper"
require "pry"

describe TripsController do
  before do
    @trip = Trip.first
    @passenger = Passenger.first
    @driver = Driver.first

    @trip.passenger = @passenger
    @trip.driver = @driver
    @trip.save
  end
  describe "update" do
    let(:trip_data) {
      { trip: {
        rating: 6,
      } }
    }

    it "shows the edit page" do
      get edit_trip_path(@trip)
      must_respond_with :ok
    end

    it "updates the trip info" do
      patch trip_path(@trip), params: trip_data
      @trip.reload
      expect(@trip.rating).must_equal 6
    end

    it "redirects if the trip does not exist" do
      patch trip_path(34567), params: trip_data
      must_respond_with :not_found
    end
  end

  describe "create" do
    it "creates a new trip" do
      expect {
        post passenger_trips_path(passenger_id: Passenger.first)
      }.must_change "Trip.count", 1
    end
  end

  describe "destroy" do
    it "removes a trip from the DB" do
      expect {
        delete trip_path(Trip.first)
      }.must_change "Trip.count", -1
    end

    it "redirects if the trip does not exist" do
      delete trip_path(12345)

      must_respond_with :redirect
    end
  end
end
