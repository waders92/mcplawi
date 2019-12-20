class Teetime < ApplicationRecord
  mount_uploader :teetime_pdf, ImageUploader

  belongs_to :user
  validates :teetime_pdf, presence: true
  validates :title, presence: true
  validates :date, presence: true

  def month
    created_at.strftime('%B %Y')
  end

  def year
    created_at.strftime('%Y')
  end

  def teetime_date
    date.strftime('%b %d, %Y')
  end
end
