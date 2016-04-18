class CoursesController < ApplicationController
  # GET /courses
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @courses = Course.active.by_name
  end
end
