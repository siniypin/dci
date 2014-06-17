require_relative './digital_rights'

class ActivatableDigitalRights < DigitalRights
  attr_reader :activation_result

  def initialize activation_result
    @activation_result = activation_result
    super(:fixed, @activation_result.expiration_date)
  end
end