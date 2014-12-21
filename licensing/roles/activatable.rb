module Activatable
  def activated?
    activation_result.activation_date.present?
  end

  def expiration_date
    return DateTime.parse("0001-01-01") if activation_result.activation_date.blank?
    calculated_expiration_date = activation_result.activation_date + activation_result.rights_term
    calculated_expiration_date < activation_result.expiration_date ? calculated_expiration_date : activation_result.expiration_date
  end

  def expiring?
    false
  end

  def expired?
    false
  end
end