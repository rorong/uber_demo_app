class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sign_up    
    user = User.new(user_params)
    if user.save
      render json: { status: true, user_details: user, message: "Created user successfully."}
    else
      render json: { status: false, message: user.errors.full_messages.join(',')}
    end
  end

  def sign_in
    if params[:user][:email].present?
      user = User.find_by(email: params[:user][:email].to_s)
      if user.present?
        user.device = params[:user][:device]
        user.device_token = params[:user][:device_token]
        user.latitude = params[:user][:latitude]
        user.longitude = params[:user][:longitude]
        user.save
        render json: { status: true, user_details: user, message: "Signed successfully"}
      else
        render json: { status: false, message: "Signed failure."}
      end
    else
      render json: { status: false, message: "Please enter email."}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :device, :device_token, :latitude, :longitude, :role)
  end
end