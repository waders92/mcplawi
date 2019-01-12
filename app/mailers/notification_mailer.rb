class NotificationMailer < ApplicationMailer
  default from: 'no-reply@mcplawi.com'

  def registration_added(event)
    @registration = event
    @registered_event = @registration.event
    @event_registrant = @registration.user

    mail(to: @event_registrant.email,
         subject: "A registration has been added for a MCPLAWI event, the #{@registered_event.event_title}")
  end
end
