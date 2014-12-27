module FactorProducer
  def produce time_span
    return self unless self.diploid? and self.has_eye?
    @x += Cell::FACTOR_PRODUCTION_VELOCITY * time_span
    self
  end
end