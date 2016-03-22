class Course < ActiveRecord::Base
  has_many :reservations

  def available_slots(date)
    raise Exception unless date.is_a?(Date)
    slots - reservations.where(date: date).count
  end

  def reserve?(date)
    return true if available_slots(date) > 0
  end
end
