class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :registered_events, through: :registrations, source: :event

  def registered_in?(event)
    registered_events.include?(event)
  end

  def self.admin_users
    User.where(admin: true).pluck(:email)
  end

  def event_cost(event)
    if self.membership_status == 'MCPLA Member'
      return event.event_cost_mcpla.round
    end
    if self.membership_status == 'Non-Member'
      return event.event_cost_non_mcpla.round
    end
    if self.membership_status =='Season Pass Holder'
      return event.event_cost_season_pass.round
    end
  end
end
