class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :registered_events, through: :registrations, source: :event
  has_many :partners, as: :partnerable
  has_many :event_partners, through: :partners, source: :event

  def registered_in?(event)
    registered_events.include?(event)
  end

  def self.admin_users
    User.where(admin: true).pluck(:email)
  end

  def event_cost(event)
    return event.event_cost_mcpla.round if membership_status == 'MCPLA Member'
    return event.event_cost_non_mcpla.round if membership_status == 'Non-Member'
    return event.event_cost_season_pass.round if membership_status == 'Season Pass Holder'
  end

  def event_partner
    if self.partners.length > 0
    return true
    else
      return false
    end
  end

end
