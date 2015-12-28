class Post < ActiveRecord::Base
	validates :title, presence: true
  
  belongs_to :person
  has_and_belongs_to_many :for, class_name: "Person"
end
