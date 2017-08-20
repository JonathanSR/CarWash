require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'

class CarTest < Minitest::Test
  def test_it_creates_an_instance_of_car
    car = Car.new({type: 'car', plates:'1111111'})

    assert_instance_of Car, car
  end

  def test_it_creates_a_car_with_type_of_car
    car = Car.new({type: 'car', plates:'1111111'})

    assert_equal 'car', car.type
  end

  def test_it_creates_a_car_with_a_license_plate_number
    car = Car.new({type: 'car', plates:'1111111'})

    assert_equal '1111111', car.plates
  end
end