module ApplicationHelper
  def calendar date = Date.today, &block
    Calendar.new(self, date, block).table
  end

  def reservations_today date
    @reservations.where(start_time: (date.beginning_of_day..date.end_of_day))
  end
end
