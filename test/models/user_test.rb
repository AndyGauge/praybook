require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User is not a guest" do
  	assert_false people(:email_user_who_is_valid).guest?
  end
end
