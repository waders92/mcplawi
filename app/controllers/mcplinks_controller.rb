class McplinksController < ApplicationController
  
  def index; end

  def clubs; end

  def officers; end

  def contact; end

  def players
    @users = if params[:term]
               User.where('LOWER(last_name) LIKE ?', "%#{params[:term].downcase}%").order('id DESC').paginate(page: params[:page])
             else
               @users = User.all.order('last_name ASC').paginate(page: params[:page], per_page: 10)
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
