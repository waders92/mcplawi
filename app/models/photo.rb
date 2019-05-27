class Photo < ApplicationRecord
  mount_uploader :winners_image, ImageUploader
  belongs_to :event

  validates :which_flight, presence: true, length: { minimum: 1 }
  validates :flight_winner, presence: true, length: { minimum: 1 }
  validates :winning_score, numericality: { greater_than: 0 }

  def year
    created_at.strftime('%Y')
  end

  def date
    result_date.strftime('%b %d, %Y')
  end
end
