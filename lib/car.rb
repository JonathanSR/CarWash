class Car
  attr_reader :type,
              :plates,
              :visits

  def initialize(type:, plates:)
    @type = type
    @plates = plates
    @visits = 0
  end
end