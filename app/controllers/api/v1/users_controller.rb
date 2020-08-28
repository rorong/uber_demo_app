class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ApiUserConcern

  def sign_up    
    user = User.new(user_params)
    response = create_user(user)
    render json: response
  end

  def sign_in
    response = find_and_update(params)
    render json: response
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :device, :device_token, :latitude, :longitude, :role)
  end
end