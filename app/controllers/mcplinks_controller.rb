class McplinksController < ApplicationController
  
  def index
    @notes = Note.last(3)
    @events = get_last_two_results()
  end

  def clubs; end

  def officers; end

  def contact; end

  def result_history
    @events = Event.all.order('created_at ASC').group_by(&:year)
  end

  def players
    @users = if params[:term]
               User.where('LOWER(last_name) LIKE ?', "%#{params[:term].downcase}%").order('last_name ASC').paginate(page: params[:page], per_page: 10)
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

  private

  def get_last_two_results
    results = []
    @events = Event.all
    @events.each do |event|
      if event.has_event_passed?(event)
        results << event
      end
    end
    return results.last(1)
  end
end
