class Person < ActiveRecord::Base
	#attr_accessor :name
	attr_reader  :email
	before_save :capitalize_name

	#TODO: add texting capibility
	#validates :name, length: {minimum: 4}
	def capitalize_name
		@name = @name.to_s.titleize
	end
end
