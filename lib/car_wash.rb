class CarWash
  attr_reader :vehicles

  def initialize
    @vehicles = Hash.new{0}
  end

  def accepts_vehicle(vehicle)
    if vehicle.respond_to?('bed') && vehicle.bed == "down"
      puts Messages.truck_bed_down
    elsif
      vehicle.respond_to?('bed')
      vehicles[vehicle.plates] = {type: vehicle.type, mud: vehicle.mud, bed: vehicle.bed, visits: 1}
    else
      vehicles[vehicle.plates] = {type: vehicle.type, visits: 1}
    end
  end

  def charges(vehicle)
    exit if vehicle.respond_to?('bed') && vehicle.bed == "down"
    if vehicles[vehicle.plates][:visits] == 2
      discount_charges(vehicle)
    else
      regular_charges(vehicle)
    end
  end
    
  def regular_charges(vehicle)
    if vehicle.type == 'car'
      puts Messages.regular_car_charges
    elsif
      vehicle.mud == "yes"
      puts Messages.regular_truck_charges_with_mud
    else
      puts Messages.regular_truck_charges
    end
  end

  def discount_charges(vehicle)
    if vehicle.type == 'car'
      puts Messages.discount_car_charges
    elsif
      vehicle.mud == "yes"
      puts Messages.discount_truck_charges_with_mud
    else
      puts Messages.regular_car_charges
    end
  end

  def plates_check(vehicle)
    if vehicle.plates == '1111111'
      puts Messages.stolen
    end
  end

  def previous_check(vehicle)
    if vehicles.has_key?(vehicle.plates)
      vehicles[vehicle.plates][:visits] += 1
    else
      accepts_vehicle(vehicle)
    end
  end
end