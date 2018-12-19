class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @events = Event.all.order('created_at DESC').group_by(&:year)
  end

  def new
    admin_required
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.invalid?
      send_flash_alert('Event not saved! Please fill in all fields!')
    end
    redirect_to admin_path
    send_flash_alert('Event was created!')
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to admin_path
  end

  def edit
    admin_required
    @event = Event.find_by(id: params[:id])
    return render_not_found if @event.blank?
  end

  def show
    @event = Event.find_by(id: params[:id])
    return render_not_found if @event.blank?
  end

  def destroy
    admin_required
    @event = Event.find_by(id: params[:id])
    @event.destroy
    redirect_to admin_path
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :event_date, :event_cost, :event_location, :event_start_time, :event_winner, :winners_picture)
  end

  def admin_required
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not an authorized administrator!'
    end
  end

  def render_not_found(status = :not_found)
    render plain: status.to_s.titleize.to_s, status: status
  end

  def send_flash_alert(message)
    flash[:alert] = message
  end
end
