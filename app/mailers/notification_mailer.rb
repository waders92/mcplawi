class NotificationMailer < ApplicationMailer
  default from: 'no-reply@mcplawi.com'

  def registration_added(event)
    @registration = event
    @registered_event = @registration.event
    @event_registrant = @registration.user
    @event_fee = @event_registrant.event_cost(@registration.event)

    mail(to: @event_registrant.email,
         subject: "A registration has been added for a MCPLAWI event, the #{@registered_event.event_title}")
  end

  def admin_notification(event)
    @registration = event
    @registered_event = @registration.event
    @event_registrant = @registration.user
    @event_fee = @event_registrant.event_cost(@registration.event)
    @users_club = @event_registrant.home_club
    mail(to: User.admin_users,
      subject: "A registration has been added for a MCPLAWI event, the #{@registered_event.event_title}")
  end
end
