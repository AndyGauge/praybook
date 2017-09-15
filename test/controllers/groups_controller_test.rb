require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:disciples)
  end

  test "should get index" do
    get groups_path
    assert_response :success
  end

  test "should get new" do
    get new_group_path
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post groups_path, params: {
          group: { name: "New Group" }
        }
    end
    assert_redirected_to groups_path
  end

  test "should not create group" do
    post groups_path, params: {
        group: { name: nil }
      }
    assert_response :success
  end

  test "should show group members" do
    get group_path(@group)
    assert_redirected_to group_memberships_path(@group)
  end

  test "should get edit" do
    get edit_group_path(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_path(@group), params: {
        group: { name: "Group name"  }
      }
    assert_redirected_to groups_path
  end

  test "should not update group" do
    patch group_path(@group), params: {
        group: { name: nil }
      }
    assert_response :success
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_path(@group)
    end

    assert_redirected_to groups_path
  end

  test "should join group" do
    post login_path, params: {
        login: {
          email: people(:user_who_can_update).email,
          password: "password"
        }
      }
    post join_group_path(@group)
    assert_redirected_to group_path(@group)
  end
end
