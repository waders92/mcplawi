class Note < ApplicationRecord
  
  belongs_to :user
  validates :note_update, presence: true, length: { minimum: 1 }

  def year
    created_at.strftime('%B %Y')
  end
end
