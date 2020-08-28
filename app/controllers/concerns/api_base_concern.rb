module ApiBaseConcern
	
	def build_hash(key, value)
    responseHash = Hash.new
    responseHash[key] = value
    return responseHash
  end

	def build_response(status, message, data = nil)
		response = { status: status, message: message}
  	response.merge!(data) if data.present? && (data.is_a? Hash)
    return response
	end
end