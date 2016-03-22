class Reservation < ActiveRecord::Base
  belongs_to :course
  belongs_to :member

  validate :course_active
  validate :course_available_slots, on: :create
  validate :member_bookings_per_course, on: :create

  def course_active
    unless course.active?
      errors.add(:errors, "Course '#{course.name}' is inactive")
    end
  end

  def course_available_slots
    unless course.reserve?(date)
      errors.add(:errors, "Course '#{course.name}' is fully booked for #{date}")
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
