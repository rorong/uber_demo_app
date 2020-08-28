class Api::V1::StreetRunsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include StreetRunConcern

  def check_street_permission
    response = check_permission(params)
    render json: response
  end

  def create    
    response = create_street_run(user_params)
    render json: response
  end

  def user_params
    params.require(:user).permit(:user_id, route_locations_attributes: [:latitude, :longitude])
  end
end
