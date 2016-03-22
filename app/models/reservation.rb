class Reservation < ActiveRecord::Base
  belongs_to :course
  belongs_to :member
end
