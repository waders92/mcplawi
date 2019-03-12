class Team < ApplicationRecord

  belongs_to :user
  validates :team_schedule_info, presence: true, length: { minimum: 1 }

  def year
    created_at.strftime('%Y')
  end
end
