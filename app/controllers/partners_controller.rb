class PartnersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def create
    @event = Event.find(params[:event_id])
    @event.partners.create(partner_params.merge(user: current_user))
    if @event.save
      send_flash_alert('Partner was added!')
    else
      send_flash_alert('Partner was not added!')
    end
    redirect_to dashboards_path
  end

  private

  def partner_params
    params.require(:partner).permit(:first_name, :last_name)
  end

  def send_flash_alert(message)
    flash[:alert] = message
  end

  def find_partnerable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end


