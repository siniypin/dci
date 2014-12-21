class DiploidCell < Cell
  def initialize x, has_eye
    super x, has_eye
  end

  def diploid?
    true
  end

  protected
  def division_strategy
    if cx >= 4
      mitosis
    else
      meiosis
    end
  end
end