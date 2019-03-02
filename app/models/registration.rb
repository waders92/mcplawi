class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user
  #after_create :send_registration_email, :send_admin_email

  def registration_time
    created_at.strftime('%b %e, %l:%M %p')
  end

  def send_registration_email
    NotificationMailer.registration_added(self).deliver_now
  end

  def send_admin_email
    NotificationMailer.admin_notification(self).deliver_now
  end
end
