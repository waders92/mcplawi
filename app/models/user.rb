class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :registered_events, through: :registrations, source: :event
  has_many :partners, dependent: :destroy
  has_many :minutes

  def registered_in?(event)
    registered_events.include?(event)
  end

  def self.admin_users
    User.where(isTreasurer: true).pluck(:email)
  end

  def event_cost(event)
    return event.event_cost_mcpla.round if membership_status == 'MCPLA Member'
    return event.event_cost_non_mcpla.round if membership_status == 'Non-Member'
    return event.event_cost_season_pass.round if membership_status == 'Season Pass Holder'
  end

  def event_partner(current_event)
    first_name = ""
    last_name = ""
    current_partner = []

    @partners = partners.all
    @partners.each do |p|
      current_partner << p
    end

    current_partner.each do |p|
      if p.event_id == current_event.id
          first_name = p.first_name
          last_name = p.last_name
      end
    end
    return first_name + " " + last_name
  end

  def has_partner_for_event(current_event)
    @partners = partners.all
    @partners.each do |p|
      if p.event_id == current_event.id
        return true
      end
    end
    return false
  end

  def registered_partner(registration)
    event = registration.event
    return event_partner(event)
  end
end
