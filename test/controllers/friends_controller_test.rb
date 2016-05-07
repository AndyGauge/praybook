require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
  setup do
    @user_id = people(:user_who_can_update).id
  end

  test "should show empty list of friends" do 
  	get :index
  	assert_response :success
  end

  test "should create new friend" do
  	post :create, person: {
  		name: "bob",
  		email: "bobby@bobsdomain.bob"
  	}, current_user_id: @user_id
  	assert_redirected_to friends_path
  end

  test "should add existing new friend" do
  	post :create, person: {
  		name: "bob",
  		email: "lrose@gmail.com"
  	}, current_user_id: @user_id
  	assert_redirected_to friends_path
  end

  test "should destroy friendship" do
    assert_difference("User.find(#{@user_id}).friends.count", -1) do
      delete :destroy, {id: people(:person_with_name).id}, current_user_id: @user_id
    end
    assert_redirected_to friends_path
  end

  test "should retrieve friend names" do
	get :names, nil, current_user_id: people(:user_who_can_update).id
	assert_response :success
  end

  test "should add person to friends" do
    assert_difference("User.find(#{@user_id}).friends.count", 1) do
      patch :update, {id: people(:simon).id}, current_user_id: @user_id
    end
    assert_redirected_to friends_path
  end

  test "should open modal for friendly prayer" do
    get :pray, id: people(:simon), current_user_id: @user_id
    assert_response :success
  end

  test "should retrieve results" do
    post :find, person: {name: "sim"}, current_user_id: @user_id
    assert_response :success
  end
     
end
