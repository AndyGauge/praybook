require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
  test "should show empty list of friends" do 
  	get :index
  	assert_response :success
  end

  test "should create new friend" do
  	post :create, person: {
  		name: "bob",
  		email: "bobby@bobsdomain.bob"
  	}, current_user_id: people(:user_who_can_update).id
  end

  test "should destroy friendship" do
  	@user_id = people(:user_who_can_update).id
  	assert_difference("User.find(#{@user_id}).friends.count", -1) do
	  	delete :destroy, id: people(:person_with_name).id,
	  	  current_user_id: @user_id
	  end
	end
end
