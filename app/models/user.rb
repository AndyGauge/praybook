class User < Person
	# Users require all fields be filled out, passwords match,
	# and email is unique (used for authentication)
	validates :name, presence: true
	validates :email, uniqueness: true
	has_secure_password

 	has_and_belongs_to_many :friends,
      class_name: "User", 
      foreign_key: :user_id, 
      association_foreign_key: :friend_id
end
