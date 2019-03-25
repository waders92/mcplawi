class Teetime < ApplicationRecord

  belongs_to :user
  validates :team_tee_time, presence: true, length: { minimum: 1 }

  def month
    created_at.strftime('%B %Y')
  end
end
