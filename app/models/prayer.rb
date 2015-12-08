class Prayer < Post
	validates :title, presence: true

	def complete!
		self.update!(type: "Praise")
	end
end
