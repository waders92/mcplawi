class Event < ApplicationRecord
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :photos

  validates :event_title, presence: true, length: { minimum: 1 }
  validates :event_start_date, presence: true
  validates :event_location, presence: true
  validates :event_cost_mcpla, numericality: { greater_than: 0 }
  validates :event_cost_non_mcpla, numericality: { greater_than: 0 }
  validates :event_cost_season_pass, numericality: { greater_than: 0 }
  validates :event_start_time, presence: true
  validates :registration_close, presence: true
  validates :is_partner_event, inclusion: { in: [ true, false ] }

  def total_registrations
    registrations.count > 0 ? registrations.count : 0
  end

  def year
    created_at.strftime('%Y')
  end

  def date
    event_start_date.strftime('%b %d, %Y')
  end

  def end_date
    event_end_date.strftime('%b %d, %Y')
  end

  def time
    event_start_time.strftime('%I:%M %p')
  end

  def reg_closes
    registration_close.strftime('%b %d, %Y')
  end
end
