class AdminController < ApplicationController
  include AdminConcern

  def index
  	if params[:todays_run].present?
      @street_runs = RouteLocation.where(created_at: Date.today.all_day)
      fetch_street_run(@street_runs)
    end
  end 
end
