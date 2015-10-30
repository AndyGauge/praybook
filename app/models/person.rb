class Person < ActiveRecord::Base
	attr_accessor :name
	attr_reader  :email

	#TODO: add texting capibility
	validates :name, length: {minimum: 4}
end
