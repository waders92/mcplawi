class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @events = Event.all.order('created_at DESC').group_by(&:year)
  end
end
