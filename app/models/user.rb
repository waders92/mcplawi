class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :registrations
  has_many :registerd_events , through: :registrations, source: :event

  def registerd_in?(event)
    return registered_events.include?(event)
  end
end
