module ApiUserConcern
	include ApiBaseConcern

	def create_user(user)
		if user.save
			response = build_response(true, "Created user successfully", build_hash("userDetails", user))
    else
    	response = build_response(false, user.errors.full_messages.join(','))
    end
    return response
	end

	def find_and_update(params)
		if params[:user][:email].present?
      response = find_user(params)
    else
      response = build_response(false, "Please enter email.")
    end
	end

	def find_user(params)
		user = User.find_by(email: params[:user][:email].to_s)
    if user.present?
      save_detail(user)
      response = build_response(true, "Signed successfully", build_hash("userDetails", user))
    else
    	response = build_response(false, "Signed failure.")
    end
    return response
	end

	def save_detail(user)
		user.device = params[:user][:device]
    user.device_token = params[:user][:device_token]
    user.latitude = params[:user][:latitude]
    user.longitude = params[:user][:longitude]
    user.save
	end
end