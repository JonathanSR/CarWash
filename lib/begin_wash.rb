require_relative '../lib/car'
require_relative '../lib/truck'
require_relative '../lib/car_wash'
require_relative '../lib/messages'

class BeginWash
  include Messages
  attr_reader :carwash,
              :vehicle

  def initialize
    @carwash = CarWash.new
    @vehicle = Truck.new({type: 'truck', mud: 'no', bed: 'up', plates:'1111121'})
    # @vehicle = Car.new({type: 'car', plates:'1111112'}) 
    start
  end
  
  def start
    puts Messages.welcome
    carwash.plates_check(vehicle)
    exit if vehicle.plates == '1111111'
    carwash.previous_check(vehicle)
    carwash.charges(vehicle)

    #Uncomment for second run through carwash
    # carwash.previous_check(vehicle)
    # carwash.charges(vehicle)

    puts Messages.goodbye
  end
end

Begin = BeginWash.new