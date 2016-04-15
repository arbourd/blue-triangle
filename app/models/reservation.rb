# == Schema Info
#
# Table name: reservations
#
#  id             :integer        not null, primary key
#  course_id      :integer        not null
#  member_id      :integer        not null
#  date           :date           not null
#  status         :integer (enum) not null
#
class Reservation < ActiveRecord::Base
  enum status: [:pending, :confirmed, :cancelled]

  belongs_to :course
  belongs_to :member

  validate :course_active
  validate :course_available_slots, on: :create
  validate :course_within_max_days, on: :create
  validate :member_bookings_per_course, on: :create

  def course_active
    errors.add(:errors, "Course '#{course.name}' is inactive") unless course.active?
  end

  def course_available_slots
    unless course.available?(date)
      errors.add(:errors, "Course '#{course.name}' is fully booked for #{date}")
    end
  end

  def course_within_max_days
    unless course.date_within_max_days?(date)
      errors.add(
        :errors,
        "Cannot book more than #{Course.MAX_DAYS} in advance for " \
        "'#{course.name}'"
      )
    end
  end

  def member_bookings_per_course
    unless member.reserve?(date)
      errors.add(
        :errors,
        "Sorry, can only book 1 course per day for user #{member.full_name}"
      )
    end
  end
end
