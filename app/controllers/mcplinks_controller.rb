class McplinksController < ApplicationController
    before_action :authenticate_user!, only: %i[admin]
  def index; end

  def clubs; end

  def admin
    admin_required
    @events = Event.all.order('created_at DESC').group_by(&:year)
    @users =  User.all.order('first_name ASC')
  end

  private 

  def admin_required
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not an authorized administrator!'
    end
  end
end
