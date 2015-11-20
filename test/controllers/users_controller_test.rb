require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	test "can get new user form" do
		get :new
		assert_response :success
	end

	test "can submit user blank" do
		post :create, user: { 
			name: "", 
			email: "", 
			password: "", 
			password_confirmation: ""
		}
		assert_response :success
	end

	test "should create new user" do
		assert_difference('User.count') do
			post :create, user: { 
				name: "UserControllerTest:test_user", 
				email: "test_user@UserControllerTest", 
				password: "passw0RD", 
				password_confirmation: "passw0RD" 
			}
		end
		assert_redirected_to user_url
	end
		
end
