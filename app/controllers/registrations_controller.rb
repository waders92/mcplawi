class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
  
    begin
    @amount = current_user.event_cost(current_event) * 100.to_i
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: current_event.event_title,
      currency: 'usd'
    )

    current_user.registrations.create(event: current_event)
    flash[:notice] = 'You have registered for the event!'
    redirect_to confirmation_path

    rescue Stripe::CardError, Stripe::InvalidRequestError, Stripe::StripeError, Stripe::AuthenticationError, Stripe::RateLimitError, Stripe::APIConnectionError  => e
    flash[:error] = e.message
    redirect_to event_path(current_event)
    NotificationMailer.send_declined_notice(current_event, current_user)
    end
  end

  private

  def current_event
    @current_event ||= Event.find(params[:event_id])
  end
end
