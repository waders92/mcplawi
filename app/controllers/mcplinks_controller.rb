class McplinksController < ApplicationController
  
  def index
    @notes = Note.last(3).reverse
    @events = get_recent_event_results()
  end

  def clubs; end

  def officers; end

  def contact; end

  def result_history
    @events = Event.all.order('created_at DESC').group_by(&:year)
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
    events = Event.all.order("created_at ASC")
    sorted_events = get_current_year_events(events)
    @events = sorted_events
  end

  private

  def get_recent_event_results
    results = []
    @events = Event.all
    @events.each do |event|
      if event.has_event_passed?(event)
        results << event
      end
    end
    return results.last(2)
  end
end
