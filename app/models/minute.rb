class Minute < ApplicationRecord
  mount_uploader :pdf_file, ImageUploader


  belongs_to :user
  validates :title, presence: true
  validates :date, presence: true
  validates :pdf_file, presence: true

  def year
    created_at.strftime('%Y')
  end

  def minutes_date
    date.strftime('%b %d, %Y')
  end
end
