class McplinksController < ApplicationController
  before_action :authenticate_user!, only: %i[admin memberships confirmation]
  def index; end

  def clubs; end

  def officers; end

  def players
    @users = if params[:term]
               User.where('LOWER(last_name) LIKE ?', "%#{params[:term].downcase}%").order('id DESC')
             else
               @users = User.all.limit(50).order('created_at DESC')
             end
    @total_users = User.all.count
  end

  def confirmation; end

  def admin
    admin_required
    @event = Event.new
    @events = Event.all.order('created_at ASC').group_by(&:year)
  end
end
