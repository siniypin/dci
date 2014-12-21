class DivideCommand
  def self.call cell
    cell.extend(Protozoon).divide
  end
end