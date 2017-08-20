require 'minitest/autorun'
require 'minitest/pride'
require './lib/car_wash'
require_relative '../lib/car'
require_relative '../lib/truck'
require_relative '../lib/messages'
require 'pry'

class CarWashTest < Minitest::Test 
  def test_it_creates_instance_of_car_wash
    carwash = CarWash.new

    assert_instance_of CarWash, carwash
  end

  def test_it_accepts_a_car
    car = Car.new({type: 'car', plates:'1111111'})
    carwash = CarWash.new
    carwash.accepts_vehicle(car)

    assert_equal 1, carwash.vehicles.count 
    assert_equal ({'1111111'=>{:type=>"car", :visits=>1}}), carwash.vehicles
  end

  def test_it_accepts_a_truck
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'up', plates:'1111111'})
    carwash = CarWash.new
    carwash.accepts_vehicle(truck)

    assert_equal 1, carwash.vehicles.count
    assert_equal ({'1111111'=>{:type=>"truck", :mud=>"no", :bed=>"up", :visits=>1}}), carwash.vehicles
  end

  def test_it_charges_five_dollars_for_car
    car = Car.new({type: 'car', plates:'1111111'}) 
    carwash = CarWash.new
    carwash.accepts_vehicle(car)


    assert_output("\nYour total for today comes out to $5.\n") { carwash.charges(car) }
  end

   def test_it_charges_ten_dollars_for_truck
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'up', plates:'1111111'})     
    carwash = CarWash.new
    carwash.accepts_vehicle(truck)

    assert_output("\nYour total for today comes out to $10.\n") {carwash.charges(truck)}
  end

  def test_it_charges_12_for_mud_on_bed_of_truck
    truck = Truck.new({type: 'truck', mud: 'yes', bed: 'up', plates:'1111111'})
    carwash = CarWash.new
    carwash.accepts_vehicle(truck)

    assert_output("\nYour total for today comes out to $12.\n") {carwash.charges(truck)}
  end

  def test_it_does_not_accept_trucks_with_bed_down
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'down', plates:'1111111'})
    carwash = CarWash.new

    assert_output("\nYour truck cannot be accepted with the bed down.\n") {carwash.accepts_vehicle(truck)}
  end

  def test_checks_if_vehicle_is_stolen
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'down', plates:'1111111'})
    carwash = CarWash.new

    assert_output("\nVehicle Stolen, cannot proceed with service.\n") {carwash.plates_check(truck)}
  end

  def test_vehicle_receives_50_percent_discount_for_second_time_at_car_wash
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'up', plates:'1234567'})
    carwash = CarWash.new 
    carwash.previous_check(truck)
    assert_equal ({'1234567'=>{:type=>"truck", :mud=>"no", :bed=>"up", :visits=>1}}) , carwash.vehicles
    
    carwash.previous_check(truck)
    assert_equal ({'1234567'=>{:type=>"truck", :mud=>"no", :bed=>"up", :visits=>2}}) , carwash.vehicles    
    check = carwash.plates_check(truck)

    assert_output("\nYour total for today comes out to $5.\n") {carwash.charges(truck)}
  end

  def test_registers_vehicle_if_it_has_not_been_at_carwash_before
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'up', plates:'1234567'})
    carwash = CarWash.new 
    carwash.previous_check(truck)

    assert_equal 1, carwash.vehicles[truck.plates][:visits]
  end
end
