class User < Person
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Users require all fields be filled out,
  # and email is unique (used for authentication)
  # validates :name, presence: true
  # validates :email, uniqueness: true

   has_and_belongs_to_many :friends,
      class_name: "Person",
      join_table: :friends_users,
      foreign_key: :user_id,
      association_foreign_key: :friend_id
end
