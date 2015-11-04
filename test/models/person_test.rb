require 'test_helper'

class PersonTest < ActiveSupport::TestCase
	test "guest is valid person" do 
		assert people(:guest).valid?
	end
	test "person with name capitalizes" do
		p = people(:person_with_name)
		p.save
		assert_equal p.name, p.name.to_s.titleize
	end
	test "person with capital name remains" do
		p = people(:person_with_capital_name)
		assert p.save
		assert_equal p.name, p.name.to_s.titleize
	end
	test "person with email has email" do
		assert_not_nil people(:person_with_email).email
	end
end
