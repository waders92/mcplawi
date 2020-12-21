class McplinksController < ApplicationController
  
  def index
    @notes = Note.last(3).reverse
    @events = get_recent_event_results()
    @teams = Team.last(3).reverse
  end

  def clubs; end

  def officers
    @mcpla_officers = Leader.where(category: 'MCPLA')
    @dretzka_officers = Leader.where(category: 'Dretzka Park')
    @oakwood_officers = Leader.where(category: 'Oakwood Park')
    @whitnall_officers = Leader.where(category: 'Whitnall Park')
    @browndeer_officers = Leader.where(category: 'Browndeer Park')
    @currie_officers = Leader.where(category: 'Currie Park')
    @greenfield_officers = Leader.where(category: 'Greenfield Park')
    @grant_officers = Leader.where(category: 'Grant Park')
  end

  def contact; end

  def result_history
    @events = Event.all.order('created_at DESC').group_by(&:year)
  end

  def event_archive
    @events = Event.all.order("created_at ASC").group_by(&:year)
  end

  def minute_archive
    @minutes = Minute.all.order("created_at DESC").group_by(&:year)
  end

  def news_archive
    @notes = Note.all.order("created_at DESC").group_by(&:year)
  end

  def teams_archive
    @teams = Team.all.order("created_at DESC").group_by(&:year)
  end

  def tee_time_archive
    @teetimes = Teetime.all.order("created_at DESC").group_by(&:year)
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

  def admin_wiki
    admin_required
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
