class LeadersController < ApplicationController

  def index 
    @mcpla_officers = Leader.where(category: 'MCPLA')
    @dretzka_officers = Leader.where(category: 'Dretzka Park')
    @oakwood_officers = Leader.where(category: 'Oakwood Park')
    @whitnall_officers = Leader.where(category: 'Whitnall Park')
    @browndeer_officers = Leader.where(category: 'Browndeer Park')
    @currie_officers = Leader.where(category: 'Currie Park')
    @greenfield_officers = Leader.where(category: 'Greenfield Park')
    @grant_officers = Leader.where(category: 'Grant Park')
  end

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
