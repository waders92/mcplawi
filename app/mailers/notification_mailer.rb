class NotificationMailer < ApplicationMailer
  default from: 'no-reply@mcplawi.com'

  def registration_added(event)
    @registration = event
    @registered_event = @registration.event
    @event_registrant = @registration.user
    @event_fee = @event_registrant.event_cost(@registration.event)
    if @event_registrant.has_partner_for_event(@registered_event)
      @player_partner = @event_registrant.event_partner(@registered_event)
    else 
      @player_partner = "NO PARTNER ADDED - CONTACT THE MCPLA TO NOTFIY THEM OF YOUR PARTNER! YOU CAN ALSO ADD ONE IN YOUR PROFILE."
    end

    mail(to: @event_registrant.email,
         subject: "A registration has been added for a MCPLAWI event, the #{@registered_event.event_title}")
  end

  def admin_notification(event)
    @registration = event
    @registered_event = @registration.event
    @event_registrant = @registration.user
    @event_fee = @event_registrant.event_cost(@registration.event)
    @users_club = @event_registrant.home_club
    if @event_registrant.has_partner_for_event(@registered_event)
      @player_partner = @event_registrant.event_partner(@registered_event)
    else 
      @player_partner = "NO PARTNER ADDED - CONTACT PLAYER DIRECTLY!"
    end
    mail(to: User.admin_users,
         subject: "MCPLA ADMIN - A registration has been added for a MCPLAWI event, the #{@registered_event.event_title}")
  end
end
