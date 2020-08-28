module SessionConcern

	def find_user(params)
		@user = User.find_by(email: params[:session][:email].to_s)
    if @user.present? && @user.role == "Admin"
      verify_user(@user, params)
    else
      flash[:danger] = "You are authorized to perform this action"
      render :new
    end
	end

	def verify_user(user, params)
		if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully."
      redirect_to admin_index_path
    else
      flash[:danger] = "Invalid email/password"
      render :new
    end
	end
end