module Unlimited
  def expiration_date
    Date::Infinity.new
  end

  def expiring?
    false
  end

  def expired?
    false
  end
end