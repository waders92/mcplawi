class McplinksController < ApplicationController
  
  def index
    @notes = Note.last(3).reverse
    @events = get_recent_event_results()
    @teams = Team.last(3).reverse
  end

  def clubs; end

  def officers
    #mcpla officers
    @mcpla_president = Leader.where(category: 'MCPLA').where(title: 'President').first
    @mcpla_vice_president = Leader.where(category: 'MCPLA').where(title: 'Vice President').first
    @mcpla_secretary = Leader.where(category: 'MCPLA').where(title: 'Secretary').first
    @mcpla_treasurer = Leader.where(category: 'MCPLA').where(title: 'Treasurer').first
    @mcpla_second_team_director = Leader.where(category: 'MCPLA').where(title: '2nd Team Director').first
    @mcpla_nimaga = Leader.where(category: 'MCPLA').where(title: 'NIMAGA Tournament Director').first
    @mcpla_tournament_director = Leader.where(category: 'MCPLA').where(title: 'MCPLA Tournament Director').first
    @mcpla_past_president = Leader.where(category: 'MCPLA').where(title: 'Past President').first
    @mcpla_committeeman = Leader.where(category: 'MCPLA').where(title: 'USGA Committeeman').first

    #club presidents
    @browndeer_president = Leader.where(category: 'Browndeer Park').where(title: 'President').first
    @currie_president = Leader.where(category: 'Currie Park').where(title: 'President').first
    @dretzka_president = Leader.where(category: 'Dretzka Park').where(title: 'President').first
    @grant_president = Leader.where(category: 'Grant Park').where(title: 'President').first
    @greenfield_president = Leader.where(category: 'Greenfield Park').where(title: 'President').first
    @oakwood_president = Leader.where(category: 'Oakwood Park').where(title: 'President').first
    @whitnall_president = Leader.where(category: 'Whitnall Park').where(title: 'President').first

    #club treasurers
    @browndeer_treasurer = Leader.where(category: 'Browndeer Park').where(title: 'Treasurer').first
    @currie_treasurer = Leader.where(category: 'Currie Park').where(title: 'Treasurer').first
    @dretzka_treasurer = Leader.where(category: 'Dretzka Park').where(title: 'Treasurer').first
    @grant_treasurer = Leader.where(category: 'Grant Park').where(title: 'Treasurer').first
    @greenfield_treasurer = Leader.where(category: 'Greenfield Park').where(title: 'Treasurer').first
    @oakwood_treasurer = Leader.where(category: 'Oakwood Park').where(title: 'Treasurer').first
    @whitnall_treasurer = Leader.where(category: 'Whitnall Park').where(title: 'Treasurer').first
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
