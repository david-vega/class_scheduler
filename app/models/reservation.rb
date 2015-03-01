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
  def self.search(search)
    if search[:name].present?
      search_by_name(search[:name])
    end
  end
  private
    def self.search_by_name(name)
      search_condition = "%#{name}%"
      where('name like ?',search_condition)
    end
end
