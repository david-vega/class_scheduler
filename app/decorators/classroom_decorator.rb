class ClassroomDecorator < Draper::Decorator
  delegate_all

  def building_name
    building.name
  end

  def current_reservations
    reservations.map{ |reservation| "#{reservation.name}: starts: #{date_format reservation.start_time}, ends: #{date_format reservation.end_time}"}
  end

  private

  def date_format date
    date.strftime('%d-%m-%Y %H:%M')
  end
end
