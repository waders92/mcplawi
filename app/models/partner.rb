class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
