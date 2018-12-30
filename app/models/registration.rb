class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def registration_time
    self.created_at.strftime('%b %e, %l:%M %p')
  end
end
