class User < ApplicationRecord
	has_secure_password
	has_many :route_locations
	ROLE = %w(Customer Diver Admin)
	validates :name, :email, :device_token, :device, :latitude, :longitude, presence: true
  validates :email, uniqueness: true
	before_validation :generate_password, on: :create

	def generate_password
    if self.email.present?
      self.temp_password = self.email
      self.password = self.email
    end
  end
end
