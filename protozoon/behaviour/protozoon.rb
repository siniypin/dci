module Protozoon
  def develop_eye
    self.has_eye = true if self.cx >= 1 and !self.has_eye? and self.diploid?
    self
  end

  def divide
    return self if age < 1.minute
    self.division_strategy
  end

  private
  def mitosis
    [
        DiploidCell.new(self.x*2/3, true),
        DiploidCell.new(self.x/3, false)
    ]
  end

  def meiosis
    [
        HaploidCell.new(self.x*3/8),
        HaploidCell.new(self.x*2/8),
        HaploidCell.new(self.x*2/8),
        HaploidCell.new(self.x/8)
    ]
  end
end