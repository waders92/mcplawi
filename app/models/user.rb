class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :registrations
  has_many :registered_events, through: :registrations, source: :event

  def registered_in?(event)
    registered_events.include?(event)
  end
end
