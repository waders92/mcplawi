class EventsController < ApplicationController
    before_action :authenticate_user!, only: %i(new create edit update destroy)

    def index
        @events = Event.all
    end

    def new
        admin_required
        @event = Event.new
    end

    private

    def admin_required
        unless current_user.admin?
            redirect_to root_path
            flash[:alert] = 'You are not authorized to add an event!'
        end  
    end
end
