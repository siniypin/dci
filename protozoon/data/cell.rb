class Cell
  FACTOR_PRODUCTION_VELOCITY = 0.5
  FACTOR_TRANSFER_VELOCITY = 0.1
  MATURITY_AGE = 10.seconds

  attr_accessor :x
  attr_accessor :has_eye
  attr_reader :age
  attr_reader :cx

  def initialize x, has_eye
    @x = x
    @has_eye = has_eye
    @birth_date = Time.now
  end

  def has_eye?
    has_eye
  end

  def age
    Time.now - @birth_date
  end

  def cx
    @x / 1
  end
end