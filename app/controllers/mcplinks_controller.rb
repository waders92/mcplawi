class McplinksController < ApplicationController
  before_action :authenticate_user!, only: %i[admin memberships confirmation]
  def index; end

  def clubs; end

  def memberships
    @users = if params[:term]
               User.where('LOWER(last_name) LIKE ?', "%#{params[:term].downcase}%").order('id DESC')
             else
               @users = User.all.limit(25).order('created_at DESC')
             end
  end

  def confirmation; end

  def admin
    admin_required
    @event = Event.new
    @events = Event.all.order('created_at DESC').group_by(&:year)
  end

  private

  def admin_required
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not an authorized administrator!'
    end
  end
end
