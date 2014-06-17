class DigitalRights
  attr_reader :expiration_date, :expiration_type

  def initialize expiration_type, expiration_date = Date::Infinity.new
    @expiration_date = expiration_date
    @expiration_type = expiration_type
  end
end