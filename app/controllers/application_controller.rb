class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate_user!
    redirect_to sign_in_path unless current_user
  end
end