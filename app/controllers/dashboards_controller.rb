class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @events = Event.all.order('created_at ASC').group_by(&:year)
  end
end
