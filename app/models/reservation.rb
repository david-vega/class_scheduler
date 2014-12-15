class Reservation < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :class_room

  validates :name, :user_id, :class_room_id, :start_time, :end_time, presence: true

  aasm column: :state do
    state :reserved, initial: true
    state :started
    state :finished

    event :finish do
      transitions from: [:reserved, :in_progress], to: :finished
    end

    event :start do
      transitions from: :reserved, to: :started
    end
  end
end