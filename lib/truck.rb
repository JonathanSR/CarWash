class Truck
  attr_reader :type,
              :mud,
              :bed,
              :plates,
              :visits

  def initialize(type:, mud:, bed:, plates:)
    @type = type
    @mud = mud
    @bed = bed
    @plates = plates
    @visits = 0
  end
end