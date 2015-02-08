class Building < ActiveRecord::Base
  include AASM

  has_many :classrooms, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  aasm column: :state do
    state :opened, initial: true
    state :closed

    event :open do
      transitions from: :closed, to: :opened
    end

    event :close do
      transitions from: :opened, to: :closed
    end
  end
end
