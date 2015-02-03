class ReservationDecorator < Draper::Decorator
  delegate_all

  def start
    format_date start_time
  end

  def end
    format_date end_time
  end

  private

  def format_date date
    date.strftime('%Y/%m/%d %H:%M')
  end
end
