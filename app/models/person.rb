class Person < ActiveRecord::Base
	before_save :capitalize_name
	has_many :posts
	has_many :prayers
	has_many :praises
	has_and_belongs_to_many :prayers_for, class_name: "Prayer", foreign_key: :post_id
	has_and_belongs_to_many :praises_for, class_name: "Praise", foreign_key: :post_id

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
