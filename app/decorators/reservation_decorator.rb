class ReservationDecorator < Draper::Decorator
  delegate_all

  def user_email
    user.email
  end
end
