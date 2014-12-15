class SuperUser < User

  def can_make_reservations?
    true
  end
end
