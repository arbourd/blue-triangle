class CoursesController < ApplicationController
  # GET /courses
  def index
    date = params[:date] || Date.today
    courses = Course.where(active: true)

    list = courses.map do |c|
      {
        id: c.id,
        name: c.name,
        slots: c.slots,
        available_slots: c.available_slots(date)
      }
    end
    render json: list
  end
end
