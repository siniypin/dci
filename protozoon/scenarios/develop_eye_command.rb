class DevelopEyeCommand
  def self.call cell
    cell.extend(Protozoon).develop_eye
  end
end