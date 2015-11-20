class User < Person
	# Users require all fields be filled out, passwords match,
	# and email is unique (used for authentication)
	validates :name, presence: true
	validates :email, uniqueness: true
	has_secure_password
end
