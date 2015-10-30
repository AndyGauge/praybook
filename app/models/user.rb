class User < Person
	validates :email, confirmation: true
	has_many :posts
	has_secure_password
end
