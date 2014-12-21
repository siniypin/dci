class TransferFactorCommand
  def self.call cell, environment, time_span
    cell.extend(FactorSource).transfer environment, time_span
  end
end