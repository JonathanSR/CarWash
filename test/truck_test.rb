require 'minitest/autorun'
require 'minitest/pride'
require './lib/truck'
require 'pry'

class TruckTest < Minitest::Test
  def test_it_creates_an_instance_of_truck
    truck = Truck.new({type: 'truck', mud: 'no', bed:'down', plates:'1111111'})

    assert_instance_of Truck, truck
  end

  def test_it_creates_a_truck_with_type_of_truck
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'down', plates:'1111111'})
   
    assert_equal 'truck', truck.type
  end

  def test_it_creates_a_truck_with_mud
    truck = Truck.new({type: 'truck', mud: 'yes', bed: 'down', plates:'1111111'})

    assert_equal 'yes', truck.mud
  end

 def test_it_creates_a_truck_with_no_mud
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'down', plates:'1111111'})

    assert_equal 'no', truck.mud
  end

  def test_it_creates_truck_with_bed_up
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'up', plates:'1111111'})
    
    assert_equal 'up', truck.bed
  end

    def test_it_creates_truck_with_bed_down
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'down', plates:'1111111'})
    
    assert_equal 'down', truck.bed
  end

  def test_it_creates_a_truck_with_plates
    truck = Truck.new({type: 'truck', mud: 'no', bed: 'down', plates:'1111111'})
    
    assert_equal '1111111', truck.plates
  end
end