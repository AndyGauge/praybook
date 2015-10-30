class User < Person
	has_many :posts
	has_secure_password
end
