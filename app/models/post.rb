class Post < ActiveRecord::Base
	validates :title, presence: true
  belongs_to :person
end
