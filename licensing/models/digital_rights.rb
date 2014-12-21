class DigitalRights
  attr_accessor :activation_result
  attr_reader :type

  def initialize type = :free
    @type = type
  end
end