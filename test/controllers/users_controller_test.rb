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

	test "should inflect User class on person" do
		get :show, {}, {'current_user_id' => people(:guest).id}
		assert_response :success
	end

	test "should create Person when trying application" do
		assert_difference('Person.count') do
			get :edit
		end
		assert_response :success
	end

	test "should update User" do
		post( :update, user: {
				name: "UserControllerTest:updateuser", 
				email: "update_user@UserControllerTest", 
				password: "passw0RD", 
				password_confirmation: "passw0RD" 
		}, current_user_id: people(:guest_updates).id)
		assert_redirected_to user_url
	end

	test "should not update User with bad password" do
		post( :update, 
			user: {name: "UserControllerTest:updateuser", 
						email: "update_user@UserControllerTest", 
						password: "passw0RD", 
						password_confirmation: "" },
			current_user_id: people(:guest_updates_bad).id)
		assert_response :success
	end
end
