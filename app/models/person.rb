class Person < ActiveRecord::Base
	before_save :capitalize_name
	has_many :posts

	#TODO: add texting capibility
	private
	def capitalize_name
		self.name = self.name.to_s.titleize
	end
end
