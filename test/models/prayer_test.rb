require 'test_helper'

class PrayerTest < ActiveSupport::TestCase

	test "should respond to complete!" do
		posts(:second_prayer).complete!
		assert posts(:second_prayer).is_a?(Praise)
	end
end
