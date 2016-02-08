require 'test_helper'

class PrayerTest < ActiveSupport::TestCase

	test "should respond to complete!" do
		@p = posts(:second_prayer)
		@p.complete!
		assert @p.type == "Praise"
	end
end
