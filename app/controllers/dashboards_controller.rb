class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @event = Event.all
  end
end
