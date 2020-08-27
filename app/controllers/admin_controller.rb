class AdminController < ApplicationController
  def index
  	if params[:todays_run].present?
      @street_runs = RouteLocation.where(created_at: Date.today.all_day)
      fetch_street_run(@street_runs)
    end
  end

  private
  def fetch_street_run street_runs
  	if street_runs.present?
  		@route_array = []
  		street_runs.each do |route_location|
  			@route_array << {lat: route_location.latitude.try(:to_f), lng: route_location.longitude.try(:to_f)}
  		end
  	else
      flash.now[:danger] = "Street run not found."
    end
  end
end
