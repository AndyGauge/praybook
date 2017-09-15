require 'test_helper'

class MembershipsControllerTest <  ActionDispatch::IntegrationTest
  setup do
    @group = groups(:disciples)
  end

  test "lists members of a group" do
    get group_memberships_path(@group)
    assert_response :success
  end
end
