class Prayer < Post

  def complete!
    self.update!(type: "Praise")
  end
end
