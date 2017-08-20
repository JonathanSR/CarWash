module Messages
  def self.welcome
    "\nWelcome to the Amazing CarWash."
  end

  def self.regular_car_charges
    "\nYour total for today comes out to $5."
  end

  def self.discount_car_charges
    "\nYour total for today comes out to $2.50."
  end

  def self.regular_truck_charges
    "\nYour total for today comes out to $10."
  end

  def self.regular_truck_charges_with_mud
    "\nYour total for today comes out to $12."
  end

  def self.discount_truck_charges_with_mud
    "\nYour total for today comes out to $6."
  end

  def self.truck_bed_down
    "\nYour truck cannot be accepted with the bed down." 
  end

  def self.goodbye
    "\nThanks for stopping by have a good rest of your day."
  end

  def self.stolen
    "\nVehicle Stolen, cannot proceed with service."
  end
end