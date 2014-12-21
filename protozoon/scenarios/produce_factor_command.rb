class ProduceFactorCommand
  def self.call cell, time_span
    cell.extend(FactorProducer).produce time_span
  end
end