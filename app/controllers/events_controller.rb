class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @events = Event.all
  end

  def new
    admin_required
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.invalid?
      flash[:alert] = 'Event not saved! Please fill in all fields!'
    end
    redirect_to root_path
    flash[:alert] = 'Event was created!'
  end

  def show
    @event = Event.find_by(id: params[:id])
    return render_not_found if @event.blank?
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :event_date, :event_cost, :event_location, :event_start_time, :event_winner, :winners_picture)
  end

  def admin_required
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not authorized to add an event!'
    end
  end

  def render_not_found(status = :not_found)
    render text: status.to_s.titleize.to_s, status: status
  end
end
