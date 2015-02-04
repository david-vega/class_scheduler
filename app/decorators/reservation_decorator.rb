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
    date.strftime('%d/%m/%Y %H:%M')
  end
end
