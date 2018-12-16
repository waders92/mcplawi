class Event < ApplicationRecord
  belongs_to :user
  has_many :registrations, dependent: :destroy
  validates :event_title, presence: true, length: { minimum: 1 }
  validates :event_date, presence: true
  validates :event_location, presence: true
  validates :event_cost, presence: true
  validates :event_start_time, presence: true

  def total_registrations
    registrations.count > 0 ? registrations.count : 0
  end

end
