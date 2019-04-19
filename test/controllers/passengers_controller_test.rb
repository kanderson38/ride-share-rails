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

    it "returns a 404 status code if the book doesn't exist" do
      passenger_id = 12345
      get passenger_path(passenger_id)
      must_respond_with :not_found
    end
  end

  describe "edit" do
    it "can get the edit page for an existing task" do
      get edit_passenger_path(passenger.id)
      must_respond_with :success
    end
  end

  describe "update" do

    it "changes the data on the model" do
      passenger_data =  { passenger: {
        name: "changed",
      }}

      passenger = Passenger.first
  
      patch passenger_path(passenger), params: passenger_data
  
      must_respond_with :redirect
      must_redirect_to passenger_path(passenger)
   
      passenger.reload
      expect(passenger.name).must_equal(passenger_data[:passenger][:name])
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
      passenger_data = {
        passenger: {
          name: "test",
          phone_num: "123",
        },
      }

      expect {
        post passengers_path, params: passenger_data
      }.must_change "Passenger.count", +1

      must_respond_with :redirect
      must_redirect_to passengers_path

      passenger = Passenger.last
      expect(passenger.name).must_equal passenger_data[:passenger][:name]
      expect(passenger.phone_num).must_equal passenger_data[:passenger][:phone_num]
    end

    it "doesn't create new passenger with bad passenger data is sent" do
      passenger_data = {
        passenger: {
          name: "",
        },
      }
      expect(Passenger.new(passenger_data[:passenger])).wont_be :valid?

      expect {
        post passengers_path, params: passenger_data
      }.wont_change "Passenger.count"

    end



  end

  describe "destroy" do
    it "removes the passenger from the database" do
      dead_passenger = Passenger.create!(name: "Tom Dead", phone_num: "SDFGSAFDG")

      expect {
        delete passenger_path(dead_passenger)
      }.must_change "Passenger.count", -1

      must_respond_with :redirect
      must_redirect_to passengers_path

      after_passenger = Passenger.find_by(id: dead_passenger.id)
      expect(after_passenger).must_be_nil

    end

    it "redirect if trying to delete book does not exist" do
      passenger_id = 12345
      expect(Passenger.find_by(id: passenger_id)).must_be_nil
      expect {
        delete passenger_path(passenger_id)
      }.wont_change "Passenger.count"
      must_respond_with :redirect
    end
    
  end



end
