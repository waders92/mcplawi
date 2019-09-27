class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    events = Event.all.order("created_at ASC")
    yearly_events = get_current_year_events(events)
    @events = yearly_events
    @partner = Partner.new
  end
end
