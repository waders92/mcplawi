class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.registrations.create(event: current_event)
    flash[:alert] = 'You are registered for the event!'
    redirect_to events_path
  end

  private

  def current_event
    @current_event ||= Event.find(params[:event_id])
  end
end
