module FactorSource
  def transfer source, time_span
    gradient = self.cx - source.cx
    amount = gradient*Cell::FACTOR_TRANSFER_VELOCITY*time_span
    source.x += amount
    self.x -= amount
  end
end