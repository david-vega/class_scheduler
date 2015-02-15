class Classroom < ActiveRecord::Base
  include AASM

  belongs_to :building
  has_many :reservations, dependent: :destroy

  validates :name, :building_id, presence: true
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

  def self.search(search)
    search_condition = "%" + search + "%"
    where('name like ?',search_condition)
  end
  
end
