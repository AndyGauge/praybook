require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = people(:user_who_can_update)
    post login_path, params: {
        login: {email: @user.email, password: "password"}
      }
  end

  test "should show empty list of friends" do
  	get friends_url
  	assert_response :success
  end

  test "should create new friend" do
  	post friends_url, params: { person: {
  		name: "bob",
  		email: "bobby@bobsdomain.bob"
  	} }
  	assert_redirected_to friends_path
  end

  test "should add existing new friend" do
  	post friends_url, params: {
      person: {
        name: "bob",
        email: "lrose@gmail.com"
      }
    }
  	assert_redirected_to friends_path
  end

  test "should destroy friendship" do
    skip("Friends are working somehow")
    assert_difference("User.find(#{@user.id}).friends.count", -1) do
      delete friend_url(people(:person_with_name))
    end
    assert_redirected_to friends_path
  end

  test "should retrieve friend names" do
	  get names_friends_path
	  assert_response :success
  end

  test "should add person to friends" do
    skip("Friends are working somehow")
    assert_difference("User.find(#{@user.id}).friends.count", 1) do
      patch friend_url(people(:simon))
    end
    assert_redirected_to friends_path
  end

  test "should open modal for friendly prayer" do
    get pray_friend_url(people(:simon))
    assert_response :success
  end

  test "should retrieve results" do
    post find_friends_url, params: {
      person: {name: "sim"}
    }
    assert_response :success
  end

end
