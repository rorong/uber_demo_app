class User < ApplicationRecord
	has_secure_password
	has_many :route_locations
	ROLE = %w(Customer Diver Admin)
	validates :name, :email, :device_token, :device, :latitude, :longitude, presence: true
  validates :email, uniqueness: true
	before_validation :generate_password, on: :create

	def generate_password
		email = self.email
    if email.present?
      self.temp_password, self.password = email
    end
  end
end
