require 'test_helper'

class PrayerTest < ActiveSupport::TestCase

	test "should respond to complete!" do
		@post = posts(:second_prayer)
		@post.complete!
		assert @post.is_a?(Praise)
	end
end
