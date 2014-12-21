class HaploidCell < Cell
  def initialize x
    super x, false
  end

  def diploid?
    false
  end

  protected
  def division_strategy
    meiosis
  end
end