class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show edit update destroy]

  def index
    events = Event.all.order("created_at DESC")
    yearly_events = get_current_year_events(events)
    @events = yearly_events
  end

  def new
    admin_required
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      send_flash_alert('Event was created!')
      redirect_to admin_path
    else
      render 'events/new'
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    if @event.save
      send_flash_alert('Event was updated!')
      redirect_to event_path(@event)
    else
      render 'events/edit'
    end
  end

  def edit
    admin_required
    @event = Event.find_by(id: params[:id])
    return render_not_found if @event.blank?
  end

  def show
    @partner = Partner.new
    @event = Event.find_by(id: params[:id])
    return render_not_found if @event.blank?
  end

  def destroy
    admin_required
    @event = Event.find_by(id: params[:id])
    @event.destroy
    send_flash_alert('Event has been removed!')
    redirect_to admin_path
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :event_start_date, :event_end_date, :event_cost_mcpla, :event_cost_non_mcpla, :event_cost_season_pass, :event_cost_season_pass_browndeer, :registration_close, :event_location, :event_start_time, :blue_golf_link, :is_partner_event)
  end
end
