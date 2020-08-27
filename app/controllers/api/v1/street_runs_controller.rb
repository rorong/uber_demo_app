class Api::V1::StreetRunsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check_street_permission
    if params[:email].present?
      user = User.find_by(email: params[:email].to_s)
      user_permission = user.registred_driver if user.present?
      if user && user_permission
        render json: { status: true, message: "Authorisation successfull." }
      else
        render json: { status: false, message: "Please Contact the Office for Authorisation" }
      end
    else
      render json: { status: false, message: "Please enter email." }
    end
  end

  def create
    if user_params[:user_id].present?
      user = User.find_by(id: user_params[:user_id])
      if user.present? && user.registred_driver
        route_locations = params[:user][:route_locations_attributes]
        route_locations.each do |route_location|
          status = false
          if user.route_locations.create(latitude: route_location["latitude"], longitude: route_location["longitude"])
            status = true
          end
        end
        if status
          render json: { status: true, street_run: user.route_locations ,message: "Created StreetRun successfully." }
        else
          render json: { status: false, message: user.route_locations.errors.full_messages.join(',') }
        end
      else
        render json: { status: false, message: "Please Contact the Office for Authorisation." }
      end
    else
      render json: { status: false, message: "User must be present." }
    end
  end

  def user_params
    params.require(:user).permit(:user_id, route_locations_attributes: [:latitude, :longitude])
  end
end
