class LeadersController < ApplicationController

  def new
    @leader = Leader.new
  end
end
