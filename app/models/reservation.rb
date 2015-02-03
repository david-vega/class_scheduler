class Reservation < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :classroom

  delegate :email, to: :user, prefix: true

  validates :name, :user_id, :classroom_id,:start_time, :end_time, presence: true

  aasm column: :state do
    state :reserved, initial: true
    state :started
    state :finished

    event :finish do
      transitions from: [:reserved, :started], to: :finished
    end

    event :start do
      transitions from: :reserved, to: :started
    end
  end
end
