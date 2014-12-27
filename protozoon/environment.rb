class Environment
  attr_accessor :volume, :x, :colony
  attr_reader :cx

  def initialize volume, x, colony
    @volume = volume
    @x = x
    @colony = colony
  end

  def cx
    @x / @volume
  end

  def tick time_span
    every_cell { |cell| ProduceFactorCommand.call cell, time_span }
    every_cell { |cell| DevelopEyeCommand.call cell }
    new_colony = []
    every_cell { |cell| new_colony << DivideCommand.call(cell) }
    @colony = new_colony.flatten
    @colony.shuffle
    every_cell { |cell| TransferFactorCommand.call cell, self, time_span }
  end

  def inspect
    puts "colony size: #{colony.size}"
    puts "colony total x amount: #{colony.reduce(0) { |x, cell| x += cell.x; x }}"
    puts "environmental x amount: #{x}"
    puts "environmental x concentration: #{cx}"
  end

  private
  def every_cell
    @colony.each do |cell|
      yield cell
    end
  end
end