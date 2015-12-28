class Person < ActiveRecord::Base
	before_save :capitalize_name
	has_many :posts
	has_many :prayers
	has_many :praises
	has_and_belongs_to_many :for, class_name: "Post"

	#TODO: add texting capibility
	
	def guest?
		!self.type
	end

	def password; end

	private
	def capitalize_name
		self.name = self.name.to_s.titleize
	end
end
