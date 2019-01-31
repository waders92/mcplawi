class Partner < ApplicationRecord
  belongs_to :partnerable, polymorphic: true
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
