class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :reservations

  def full_name
    "#{fname} #{lname}"
  end

  def number_of_reservations(date)
    raise Exception unless date.is_a?(Date)
    reservations.where(date: date).count
  end

  def reserve?(date)
    return true if number_of_reservations(date) < 1
  end
end
