class Event < ApplicationRecord
  belongs_to :user
  mount_uploader :winners_picture, ImageUploader
  has_many :registrations, dependent: :destroy

  validates :event_title, presence: true, length: { minimum: 1 }
  validates :event_start_date, presence: true
  validates :event_location, presence: true
  validates_presence_of :event_cost_mcpla, numericality: { only_integer: true }
  validates_presence_of :event_cost_non_mcpla, numericality: { only_integer: true }
  validates_presence_of :event_cost_season_pass, numericality: { only_integer: true }
  validates :event_start_time, presence: true
  validates :registration_close, presence: true

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
