class PartnersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  respond_to :html, :xml, :json

  def new
   @partner = Partner.new
 end

  def create
    @partner =current_user.create_partner(partner_params)

    if @partner.save
     send_flash_alert('Partner was added!')
     redirect_to dashboards_path
   else
     render 'partners/new'
   end
 end

  def edit
    @partner = Partner.find_by(id: params[:id])
  end

  def update 
   @partner = Partner.find_by(id: params[:id])
   @partner.update(partner_params)
     if @partner.save
      send_flash_alert('Partner was updated!')
      redirect_to dashboards_path
     else
      render 'partners/edit'
     end
  end
  
  def destroy
    @partner = Partner.find_by(id: params[:id])
    @partner.destroy
    send_flash_alert('Parnter has been removed!')
    redirect_to dashboards_path
  end

  private

  def partner_params
    params.require(:partner).permit(:first_name, :last_name)
  end

  def send_flash_alert(message)
    flash[:alert] = message
  end
end


