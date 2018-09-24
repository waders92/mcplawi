class Event < ApplicationRecord
  belongs_to :user
  has_many :registrations
  validates :event_title, presence: true, length: { minimum: 1 }
  validates :event_date, presence: true
  validates :event_location, presence: true
  validates :event_cost, presence: true
  validates :event_start_time, presence: true
end
