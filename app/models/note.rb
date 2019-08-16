class Note < ApplicationRecord
  mount_uploader :event_pdf, ImageUploader

  belongs_to :user
  validates :note_update, presence: true, length: { minimum: 1 }

  def year
    created_at.strftime('%B %Y')
  end

  def published_date
    created_at.strftime('%b %d, %Y')
  end
end
