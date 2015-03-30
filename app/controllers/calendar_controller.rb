class CalendarController < ApplicationController
  before_filter :authenticate_user!

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @reservations = Reservation.where(classroom_id: 1).starts_this_month(@date)
  end
end
