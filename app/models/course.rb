class Course < ActiveRecord::Base
  has_many :reservations

  MAX_DAYS = 60

  def available_slots(date)
    raise Exception unless date.is_a?(Date)
    slots - reservations.where(date: date).count
  end

  def date_within_max_days?(date)
    Date.today <= date && date <= Date.today + MAX_DAYS
  end

  def available?(date)
    return true if available_slots(date) > 0
  end
end
