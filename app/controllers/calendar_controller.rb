class CalendarController < ApplicationController
  before_filter :authenticate_user!

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @reservations = get_reservations
  end

  private

  def find_classroom
    Classroom.find_by_name(params[:classroom_name].gsub('_', ' '))
  end

  def get_reservations
    classroom = find_classroom
    classroom.reservations.try(:start_this_month, @date) if classroom
  end
end
