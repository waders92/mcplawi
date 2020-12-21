class LeadersController < ApplicationController

  def new
    admin_required
    @leader = Leader.new
  end

  def create
    @leader = Leader.new(leader_params)

    if @leader.save
      send_flash_alert('Officer was added!')
      redirect_to admin_path
    else
      render 'leader/new'
    end
  end

  def edit
    @leader = Leader.find(params[:id])
  end

  def update
    @leader= Leader.find_by(id: params[:id])
    @leader.update(leader_params)
    send_flash_alert('Officer was updated!')
    redirect_to admin_path
  end

  private

  def leader_params
    params.require(:leader).permit(:category, :title, :name, :phone, :email)
  end
end
