class Event < ApplicationRecord
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :partners, dependent: :destroy

  validates :event_title, presence: true, length: { minimum: 1 }
  validates :event_start_date, presence: true
  validates :event_location, presence: true
  validates :event_cost_mcpla, numericality: { greater_than: 0 }
  validates :event_cost_non_mcpla, numericality: { greater_than: 0 }
  validates :event_cost_season_pass, numericality: { greater_than: 0 }
  validates :event_start_time, presence: true
  validates :registration_close, presence: true
  validates :is_partner_event, inclusion: { in: [ true, false ] }

  validate :event_date_cannot_be_in_the_next_year

  def event_date_cannot_be_in_the_next_year
    if self.event_start_date.year != Date.today.year
      @current_year = Date.today.year.to_s
      @event_year = self.event_start_date.year.to_s
      errors.add(:event_start_date, "Can only create events for the current year! The event start date year is " + @event_year + " and the current year is " + @current_year)
    end
  end 
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

  def has_event_passed?(event)
    return true if event.event_start_date < Date.today
  end
end
