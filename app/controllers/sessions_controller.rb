class SessionsController < ApplicationController

  def create
    if params.dig(:session, :email).present? && params.dig(:session, :password).present?
      @user = User.find_by(email: params[:session][:email].to_s)
      if @user.present? && @user.role == "Admin"
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          flash[:success] = "You have logged in successfully."
          redirect_to admin_index_path
        else
          flash[:danger] = "Invalid email/password"
          render :new
        end
      else
        flash[:danger] = "You are authorized to perform this action"
        render :new
      end
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
