require 'test_helper'

class MembershipsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:disciples)
  end

  test "lists members of a group" do
    get :index, group_id: @group.id
    assert_response :success
  end
end
