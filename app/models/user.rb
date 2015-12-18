class User < Person
	# Users require all fields be filled out, passwords match,
	# and email is unique (used for authentication)
	validates :name, presence: true
	validates :email, uniqueness: true
	has_secure_password

 	has_and_belongs_to_many :friends,
      class_name: "User", 
      join_table: :friends_users, 
      foreign_key: :user_id, 
      association_foreign_key: :friend_id


	#Create a user from Person
	def self.create_from_person(whom, attrs)
		@user = User.new(attrs)
		@user.post_ids = whom.post_ids unless @user.invalid?
		@user if @user.save && whom.destroy
		nil
	end
end
