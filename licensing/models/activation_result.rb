class ActivationResult
  attr_accessor :expiration_date, :activation_code, :activation_date, :rights_term

  def initialize attributes = {}
    attributes.each { |k, v| send("#{k}=", v) }
  end
end