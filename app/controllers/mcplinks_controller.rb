class McplinksController < ApplicationController
  before_action :authenticate_user!, only: %i[admin]
  def index; end

  def clubs; end

  def admin
    admin_required
    @event = Event.new
    @events = Event.all.order('created_at DESC').group_by(&:year)
    @users = if params[:term]
      User.where('LOWER(last_name) LIKE ?', "%#{params[:term].downcase}%").order('id DESC')
    else 
      @users = User.all.limit(10).order('created_at DESC')
    end
  end

  private

  def admin_required
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not an authorized administrator!'
    end
  end
end
