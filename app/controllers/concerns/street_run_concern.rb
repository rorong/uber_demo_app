module StreetRunConcern
	include ApiBaseConcern

	def check_permission(params)
		if params[:email].present?
			response = find_registred_driver(params)
    else
      response = build_response(false, "Please enter email.")
    end
    return response
	end


	def find_registred_driver(params)
		user = User.find_by(email: params[:email].to_s)
    user_permission = user.registred_driver if user.present?
    if user && user_permission
    	response = build_response(true, "Authorisation successfull.")
    else
    	response = build_response(false, "Please Contact the Office for Authorisation")
    end
    return response
	end

	def create_street_run(params)
		if user_params[:user_id].present?
			response = save_route_locations(params)
    else
    	response = build_response(false, "User must be present.")
    end
    return response
	end

	def save_route_locations(params)
		user = User.find_by(id: params[:user_id])
    if user.present? && user.registred_driver
      status = create_route_locations(user, params[:route_locations_attributes])     
      response = check_data_created(status, user)
    else
    	response = build_response(false, "Please Contact the Office for Authorisation.")
    end
    return response
	end

	def create_route_locations(user, route_locations)
		route_locations.each do |route_location|
      status = false
      if user.route_locations.create(latitude: route_location["latitude"], longitude: route_location["longitude"])
        status = true
      end
    end
    return status
	end

	def check_data_created(status, user)
		if status
			response = build_response(true, "Created StreetRun successfully.", build_hash("routeLocations", user.route_locations))
    else
    	response = build_response(false, user.route_locations.errors.full_messages.join(','))
    end
    return response
	end
end