class CalendarController < ApplicationController
  before_filter :authenticate_user!

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
