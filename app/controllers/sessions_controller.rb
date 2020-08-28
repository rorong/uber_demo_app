class SessionsController < ApplicationController
  include SessionConcern
  
  def create
    if params.dig(:session, :email).present? && params.dig(:session, :password).present?
      find_user(params)
    else
      flash[:danger] = "Please Enter email/password"
        render :new
    end
  end

  def destroy
    if session[:user_id].present?
      session[:user_id] = nil
      redirect_to root_path
    end
  end
end
