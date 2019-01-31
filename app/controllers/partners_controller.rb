class PartnersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  respond_to :html, :xml, :json

  def new
    @event = Event.find(params[:event_id])
    @partner = @event.partners.build
  end

  def create
    @event = Event.find(params[:event_id])
    @partner = @event.partners.create!(partner_params)

    if @partner.save
      send_flash_alert('Partner was added!')
      redirect_to dashboards_path
    else
      render 'partners/new'
    end
  end

  def edit

  end

  def update 

  end

  private

  def partner_params
    params.require(:partner).permit(:first_name, :last_name)
  end

  def send_flash_alert(message)
    flash[:alert] = message
  end

  def current_event
    @current_event ||= Event.find(params[:event_id])
  end
end


