class TeamsController < ApplicationController

  def index 
    @teams = Team.all.order("created_at ASC").group_by(&:year)
  end

  def new
    admin_required
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      send_flash_alert('Team schedule was created!')
      redirect_to teams_path
    else
      render 'teams/new'
    end
  end

  def edit
    admin_required
    @team = Team.find_by(id: params[:id])
    return render_not_found if @team.blank?
  end

  def update
    @team = Team.find_by(id: params[:id])
    @team.update(team_params)
    if @team.save
      send_flash_alert('Team schedules were updated!')
      redirect_to teams_path
    else
      render 'teams/edit'
    end
  end

  def destroy
    admin_required
    @team = Team.find_by(id: params[:id])
    @team.destroy
    send_flash_alert('Team schedule has been removed!')
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:team_schedule_info)
  end
end
